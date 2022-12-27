Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EC110E02D
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Dec 2022 06:20:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------UUW2OJNdB012G730pIB8zxy0"
Message-ID: <34bb5e25-3548-21c8-3a39-08777b181541@intel.com>
Date: Tue, 27 Dec 2022 11:50:36 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20221115170855.196572-23-bhanuprakash.modem@intel.com>
 <20221215104039.1517970-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20221215104039.1517970-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v6 22/52] tests/kms_plane: Add support for
 Bigjoiner
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--------------UUW2OJNdB012G730pIB8zxy0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 12/15/2022 4:10 PM, Bhanuprakash Modem wrote:
> This patch will add a check to Skip the subtest if a selected pipe/output
> combo won't support Bigjoiner or 8K mode.
>
> Example:
> * Pipe-D wont support a mode > 5K
> * To use 8K mode on a pipe then consecutive pipe must be available & free.
>
> V2: - Use updated helper name
> V3: - Rebase
>
> Signed-off-by: Bhanuprakash Modem<bhanuprakash.modem@intel.com>
> ---
>   tests/kms_plane.c | 30 +++++++++++++++++++-----------
>   1 file changed, 19 insertions(+), 11 deletions(-)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 164dacf4..a79802f6 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -56,6 +56,7 @@ typedef struct {
>   typedef struct {
>   	int drm_fd;
>   	igt_display_t display;
> +	igt_output_t *output;
>   	igt_pipe_crc_t *pipe_crc;
>   	const color_t *colors;
>   	int num_colors;
> @@ -274,11 +275,11 @@ static void
>   test_plane_position(data_t *data, enum pipe pipe)
>   {
>   	int n_planes = data->display.pipes[pipe].n_planes;
> -	igt_output_t *output;
> +	igt_output_t *output = data->output;
>   	igt_crc_t reference_crc;
>
> -	output = igt_get_single_output_for_pipe(&data->display, pipe);
> -	igt_require(output);
> +	igt_info("Using (pipe %s + %s) to run the subtest.\n",
> +		 kmstest_pipe_name(pipe), igt_output_name(output));

Hi,

This igt_info seems redundant here as we already have an igt_info doing 
the same thing.

	Using (pipe B + HDMI-A-4) to run the subtest.
	Testing connector HDMI-A-4 using pipe B, mode 1920x1080

>   	test_init(data, pipe);
>   	test_grab_crc(data, output, pipe, &green, data->flags, &reference_crc);
> @@ -383,11 +384,11 @@ test_plane_panning(data_t *data, enum pipe pipe)
>   {
>   	bool mode_found = false;
>   	uint64_t mem_size = 0;
> -	igt_output_t *output;
> +	igt_output_t *output = data->output;
>   	igt_crc_t ref_crc;
>
> -	output = igt_get_single_output_for_pipe(&data->display, pipe);
> -	igt_require(output);
> +	igt_info("Using (pipe %s + %s) to run the subtest.\n",
> +		 kmstest_pipe_name(pipe), igt_output_name(output));
Same here.
>
>   	test_init(data, pipe);
>
> @@ -1076,7 +1077,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
>   	igt_plane_t *primary;
>   	drmModeModeInfo *mode;
>   	bool result;
> -	igt_output_t *output;
> +	igt_output_t *output = data->output;
>   	igt_plane_t *plane;
>
>   	if (data->extended) {
> @@ -1087,10 +1088,10 @@ test_pixel_formats(data_t *data, enum pipe pipe)
>   		data->num_colors = ARRAY_SIZE(colors_reduced);
>   	}
>
> -	test_init(data, pipe);
> +	igt_info("Using (pipe %s + %s) to run the subtest.\n",
> +		 kmstest_pipe_name(pipe), igt_output_name(output));
Same here.
>
> -	output = igt_get_single_output_for_pipe(&data->display, pipe);
> -	igt_require(output);
> +	test_init(data, pipe);
>
>   	mode = igt_output_get_mode(output);
>
> @@ -1134,7 +1135,14 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
>   	enum pipe pipe;
>   	int count = 0;
>
> -	for_each_pipe(&data->display, pipe) {
> +	for_each_pipe_with_single_output(&data->display, pipe, data->output) {
> +		igt_display_reset(&data->display);
> +
> +		igt_output_set_pipe(data->output, pipe);
> +		if (!i915_pipe_output_combo_valid(&data->display))
> +			continue;
> +
> +		igt_output_set_pipe(data->output, PIPE_NONE);

With the above igt_info's removed, the patch LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

Thanks,
Karthik.B.S
>   		igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
>   			test(data, pipe);
>
> --
> 2.38.1
>
--------------UUW2OJNdB012G730pIB8zxy0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/15/2022 4:10 PM, Bhanuprakash
      Modem wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20221215104039.1517970-1-bhanuprakash.modem@intel.com">
      <pre class="moz-quote-pre" wrap="">This patch will add a check to Skip the subtest if a selected pipe/output
combo won't support Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode &gt; 5K
* To use 8K mode on a pipe then consecutive pipe must be available &amp; free.

V2: - Use updated helper name
V3: - Rebase

Signed-off-by: Bhanuprakash Modem <a class="moz-txt-link-rfc2396E" href="mailto:bhanuprakash.modem@intel.com">&lt;bhanuprakash.modem@intel.com&gt;</a>
---
 tests/kms_plane.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 164dacf4..a79802f6 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -56,6 +56,7 @@ typedef struct {
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
+	igt_output_t *output;
 	igt_pipe_crc_t *pipe_crc;
 	const color_t *colors;
 	int num_colors;
@@ -274,11 +275,11 @@ static void
 test_plane_position(data_t *data, enum pipe pipe)
 {
 	int n_planes = data-&gt;display.pipes[pipe].n_planes;
-	igt_output_t *output;
+	igt_output_t *output = data-&gt;output;
 	igt_crc_t reference_crc;

-	output = igt_get_single_output_for_pipe(&amp;data-&gt;display, pipe);
-	igt_require(output);
+	igt_info(&quot;Using (pipe %s + %s) to run the subtest.\n&quot;,
+		 kmstest_pipe_name(pipe), igt_output_name(output));
</pre>
    </blockquote>
    <p>Hi,</p>
    <p>This igt_info seems redundant here as we already have an igt_info
      doing the same thing.</p>
    <pre style="font-family: monospace; margin: 0px; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">	Using (pipe B + HDMI-A-4) to run the subtest.
	Testing connector HDMI-A-4 using pipe B, mode 1920x1080</pre>
    <p></p>
    <blockquote type="cite" cite="mid:20221215104039.1517970-1-bhanuprakash.modem@intel.com">
      <pre class="moz-quote-pre" wrap="">
 	test_init(data, pipe);
 	test_grab_crc(data, output, pipe, &amp;green, data-&gt;flags, &amp;reference_crc);
@@ -383,11 +384,11 @@ test_plane_panning(data_t *data, enum pipe pipe)
 {
 	bool mode_found = false;
 	uint64_t mem_size = 0;
-	igt_output_t *output;
+	igt_output_t *output = data-&gt;output;
 	igt_crc_t ref_crc;

-	output = igt_get_single_output_for_pipe(&amp;data-&gt;display, pipe);
-	igt_require(output);
+	igt_info(&quot;Using (pipe %s + %s) to run the subtest.\n&quot;,
+		 kmstest_pipe_name(pipe), igt_output_name(output));</pre>
    </blockquote>
    Same here.<br>
    <blockquote type="cite" cite="mid:20221215104039.1517970-1-bhanuprakash.modem@intel.com">
      <pre class="moz-quote-pre" wrap="">

 	test_init(data, pipe);

@@ -1076,7 +1077,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	bool result;
-	igt_output_t *output;
+	igt_output_t *output = data-&gt;output;
 	igt_plane_t *plane;

 	if (data-&gt;extended) {
@@ -1087,10 +1088,10 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 		data-&gt;num_colors = ARRAY_SIZE(colors_reduced);
 	}

-	test_init(data, pipe);
+	igt_info(&quot;Using (pipe %s + %s) to run the subtest.\n&quot;,
+		 kmstest_pipe_name(pipe), igt_output_name(output));</pre>
    </blockquote>
    Same here.<br>
    <blockquote type="cite" cite="mid:20221215104039.1517970-1-bhanuprakash.modem@intel.com">
      <pre class="moz-quote-pre" wrap="">

-	output = igt_get_single_output_for_pipe(&amp;data-&gt;display, pipe);
-	igt_require(output);
+	test_init(data, pipe);

 	mode = igt_output_get_mode(output);

@@ -1134,7 +1135,14 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 	enum pipe pipe;
 	int count = 0;

-	for_each_pipe(&amp;data-&gt;display, pipe) {
+	for_each_pipe_with_single_output(&amp;data-&gt;display, pipe, data-&gt;output) {
+		igt_display_reset(&amp;data-&gt;display);
+
+		igt_output_set_pipe(data-&gt;output, pipe);
+		if (!i915_pipe_output_combo_valid(&amp;data-&gt;display))
+			continue;
+
+		igt_output_set_pipe(data-&gt;output, PIPE_NONE);</pre>
    </blockquote>
    <p>With the above igt_info's removed, the patch LGTM.</p>
    <p>Reviewed-by: Karthik B S <a class="moz-txt-link-rfc2396E" href="mailto:karthik.b.s@intel.com">&lt;karthik.b.s@intel.com&gt;</a></p>
    Thanks,<br>
    Karthik.B.S<br>
    <blockquote type="cite" cite="mid:20221215104039.1517970-1-bhanuprakash.modem@intel.com">
      <pre class="moz-quote-pre" wrap="">
 		igt_dynamic_f(&quot;pipe-%s-planes&quot;, kmstest_pipe_name(pipe))
 			test(data, pipe);

--
2.38.1

</pre>
    </blockquote>
  </body>
</html>

--------------UUW2OJNdB012G730pIB8zxy0--

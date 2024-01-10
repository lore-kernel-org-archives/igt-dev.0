Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB0710E0F8
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 06:01:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------88v0JDubO7Cst3YLGJ0c0R0w"
Message-ID: <078f8a4d-56ea-4b3b-9f5b-2a69853696ba@intel.com>
Date: Wed, 10 Jan 2024 11:31:42 +0530
MIME-Version: 1.0
Subject: Re: [i-g-t, 3/3] tests/intel/kms_dsc_helper: add dsc+big joiner helper
 func
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20240105155951.124374-4-swati2.sharma@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240105155951.124374-4-swati2.sharma@intel.com>
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

This is a multi-part message in MIME format.
--------------88v0JDubO7Cst3YLGJ0c0R0w
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/5/2024 9:29 PM, Swati Sharma wrote:
> Add helper functions dsc with big joiner helper functions.
>
> Signed-off-by: Swati Sharma<swati2.sharma@intel.com>
> ---
>   tests/intel/kms_dsc_helper.c | 32 ++++++++++++++++++++++++++++++++
>   tests/intel/kms_dsc_helper.h |  3 +++
>   2 files changed, 35 insertions(+)
>
> diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
> index 58057aca3..91ce21062 100644
> --- a/tests/intel/kms_dsc_helper.c
> +++ b/tests/intel/kms_dsc_helper.c
> @@ -7,8 +7,10 @@
>   
>   static bool force_dsc_en_orig;
>   static bool force_dsc_fractional_bpp_en_orig;
> +static bool force_dsc_bigjoiner_en_orig;
>   static int force_dsc_restore_fd = -1;
>   static int force_dsc_fractional_bpp_restore_fd = -1;
> +static int force_dsc_bigjoiner_restore_fd = -1;
>   
>   void force_dsc_enable(int drmfd, igt_output_t *output)
>   {
> @@ -201,3 +203,33 @@ bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *outp
>   
>   	return true;
>   }
> +
> +void force_dsc_bigjoiner_enable(int drmfd, igt_output_t *output)
> +{
> +	int ret;
> +
> +	igt_debug("Forcing DSC Big Joiner on %s\n", output->name);
> +	ret = igt_force_bigjoiner_enable(drmfd, output->name);
> +	igt_assert_f(ret == 0, "forcing dsc big joiner debugfs_write failed\n");
> +}
> +
> +void save_force_dsc_bigjoiner_en(int drmfd, igt_output_t *output)
> +{
> +	force_dsc_bigjoiner_en_orig =
> +		igt_is_force_bigjoiner_enabled(drmfd, output->name);
> +	force_dsc_bigjoiner_restore_fd =
> +		igt_get_bigjoiner_debugfs_fd(drmfd, output->name);
> +	igt_assert(force_dsc_bigjoiner_restore_fd >= 0);
> +}
> +
> +void restore_force_dsc_bigjoiner_en(void)
> +{
> +	if (force_dsc_bigjoiner_restore_fd < 0)
> +		return;
> +
> +	igt_debug("Restoring DSC Big Joiner enable\n");
> +	igt_assert(write(force_dsc_bigjoiner_restore_fd, force_dsc_bigjoiner_en_orig ? "1" : "0", 1) == 1);
> +
> +	close(force_dsc_bigjoiner_restore_fd);
> +	force_dsc_bigjoiner_restore_fd = -1;
> +}


Hello Swati,

These functions (force_dsc_enable, save_force_dsc_bigjoiner_en and restore_force_dsc_bigjoiner_en) seems to be generic and not dsc specific.
Can this be somewhere where other IGT"s can use them?


Thanks and Regards
Kunal Joshi


--------------88v0JDubO7Cst3YLGJ0c0R0w
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/5/2024 9:29 PM, Swati Sharma
      wrote:<br>
    </div>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">Add helper functions dsc with big joiner helper functions.

Signed-off-by: Swati Sharma <a class="moz-txt-link-rfc2396E" href="mailto:swati2.sharma@intel.com">&lt;swati2.sharma@intel.com&gt;</a>
---
 tests/intel/kms_dsc_helper.c | 32 ++++++++++++++++++++++++++++++++
 tests/intel/kms_dsc_helper.h |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
index 58057aca3..91ce21062 100644
--- a/tests/intel/kms_dsc_helper.c
+++ b/tests/intel/kms_dsc_helper.c
@@ -7,8 +7,10 @@
 
 static bool force_dsc_en_orig;
 static bool force_dsc_fractional_bpp_en_orig;
+static bool force_dsc_bigjoiner_en_orig;
 static int force_dsc_restore_fd = -1;
 static int force_dsc_fractional_bpp_restore_fd = -1;
+static int force_dsc_bigjoiner_restore_fd = -1;
 
 void force_dsc_enable(int drmfd, igt_output_t *output)
 {
@@ -201,3 +203,33 @@ bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *outp
 
 	return true;
 }
+
+void force_dsc_bigjoiner_enable(int drmfd, igt_output_t *output)
+{
+	int ret;
+
+	igt_debug("Forcing DSC Big Joiner on %s\n", output-&gt;name);
+	ret = igt_force_bigjoiner_enable(drmfd, output-&gt;name);
+	igt_assert_f(ret == 0, "forcing dsc big joiner debugfs_write failed\n");
+}
+
+void save_force_dsc_bigjoiner_en(int drmfd, igt_output_t *output)
+{
+	force_dsc_bigjoiner_en_orig =
+		igt_is_force_bigjoiner_enabled(drmfd, output-&gt;name);
+	force_dsc_bigjoiner_restore_fd =
+		igt_get_bigjoiner_debugfs_fd(drmfd, output-&gt;name);
+	igt_assert(force_dsc_bigjoiner_restore_fd &gt;= 0);
+}
+
+void restore_force_dsc_bigjoiner_en(void)
+{
+	if (force_dsc_bigjoiner_restore_fd &lt; 0)
+		return;
+
+	igt_debug("Restoring DSC Big Joiner enable\n");
+	igt_assert(write(force_dsc_bigjoiner_restore_fd, force_dsc_bigjoiner_en_orig ? "1" : "0", 1) == 1);
+
+	close(force_dsc_bigjoiner_restore_fd);
+	force_dsc_bigjoiner_restore_fd = -1;
+}</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Hello Swati,<br>
    </p>
    <pre class="moz-quote-pre" wrap="">These functions (force_dsc_enable, save_force_dsc_bigjoiner_en and restore_force_dsc_bigjoiner_en) seems to be generic and not dsc specific.
Can this be somewhere where other IGT"s can use them?


Thanks and Regards
Kunal Joshi


<span style="white-space: normal"></span></pre>
    <p></p>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------88v0JDubO7Cst3YLGJ0c0R0w--

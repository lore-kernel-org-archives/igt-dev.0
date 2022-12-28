Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141AF10E37B
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Dec 2022 05:58:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------9cWeOn0TBDWEE5NU5bvC1LA0"
Message-ID: <5af24279-f818-0426-b0d3-35b226262bdf@intel.com>
Date: Wed, 28 Dec 2022 11:28:41 +0530
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
 <20221115170855.196572-29-bhanuprakash.modem@intel.com>
From: "Sharma, Ananya" <ananya.sharma@intel.com>
In-Reply-To: <20221115170855.196572-29-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v5 28/52] tests/kms_prime: Add support for
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

--------------9cWeOn0TBDWEE5NU5bvC1LA0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 15-11-2022 22:38, Bhanuprakash Modem wrote:
> This patch will add a check to Skip the subtest if a selected pipe/output
> combo won't support Bigjoiner or 8K mode.
>
> Example:
> * Pipe-D wont support a mode > 5K
> * To use 8K mode on a pipe then consecutive pipe must be available & free.
>
> V2: - Use updated helper name
>
> Signed-off-by: Bhanuprakash Modem<bhanuprakash.modem@intel.com>

Reviewed-by: Ananya Sharma <ananya.sharma@intel.com>

> ---
>   tests/kms_prime.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index 097c2f2a..d4a92651 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -89,14 +89,17 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
>   	bool found = false;
>   
>   	for_each_pipe_with_valid_output(display, *pipe, output) {
> -		found = true;
> -		break;
> +		igt_display_reset(display);
> +
> +		igt_output_set_pipe(output, *pipe);
> +		if (i915_pipe_output_combo_valid(display)) {
> +			found = true;
> +			break;
> +		}
>   	}
>   
>   	igt_require_f(found, "No valid connector/pipe found\n");
>   
> -	igt_display_reset(display);
> -	igt_output_set_pipe(output, *pipe);
>   	return output;
>   }
>   
--------------9cWeOn0TBDWEE5NU5bvC1LA0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 15-11-2022 22:38, Bhanuprakash Modem
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20221115170855.196572-29-bhanuprakash.modem@intel.com">
      <pre class="moz-quote-pre" wrap="">This patch will add a check to Skip the subtest if a selected pipe/output
combo won't support Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode &gt; 5K
* To use 8K mode on a pipe then consecutive pipe must be available &amp; free.

V2: - Use updated helper name

Signed-off-by: Bhanuprakash Modem <a class="moz-txt-link-rfc2396E" href="mailto:bhanuprakash.modem@intel.com">&lt;bhanuprakash.modem@intel.com&gt;</a></pre>
    </blockquote>
    <p class="MsoPlainText"><font face="monospace">Reviewed-by: Ananya
        Sharma &lt;<a href="mailto:ananya.sharma@intel.com" class="moz-txt-link-freetext">ananya.sharma@intel.com</a>&gt;</font></p>
    <blockquote type="cite" cite="mid:20221115170855.196572-29-bhanuprakash.modem@intel.com">
      <pre class="moz-quote-pre" wrap="">---
 tests/kms_prime.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 097c2f2a..d4a92651 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -89,14 +89,17 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
 	bool found = false;
 
 	for_each_pipe_with_valid_output(display, *pipe, output) {
-		found = true;
-		break;
+		igt_display_reset(display);
+
+		igt_output_set_pipe(output, *pipe);
+		if (i915_pipe_output_combo_valid(display)) {
+			found = true;
+			break;
+		}
 	}
 
 	igt_require_f(found, &quot;No valid connector/pipe found\n&quot;);
 
-	igt_display_reset(display);
-	igt_output_set_pipe(output, *pipe);
 	return output;
 }
 
</pre>
    </blockquote>
  </body>
</html>

--------------9cWeOn0TBDWEE5NU5bvC1LA0--

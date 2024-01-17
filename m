Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95DA10E1AF
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 09:20:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------JorFaihiKQWGSvLrokqzTYu3"
Message-ID: <e4bc91db-76b6-4db7-8d2d-8a80096de740@linux.intel.com>
Date: Wed, 17 Jan 2024 10:20:04 +0100
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v2 1/4] opencl/compute_increment_kernel: Add opencl
 increment kernel
References: <20240116212756.2687603-1-janga.rahul.kumar@intel.com>
 <20240116212756.2687603-2-janga.rahul.kumar@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240116212756.2687603-2-janga.rahul.kumar@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com
Cc: nirmoy.das@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------JorFaihiKQWGSvLrokqzTYu3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/16/2024 10:27 PM, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar<janga.rahul.kumar@intel.com>
>
> Compute opencl increment kernel provided here is used in
> xe_compute_preempt test.
>
> Cc: Nirmoy Das<nirmoy.das@intel.com>
> Signed-off-by: Janga Rahul Kumar<janga.rahul.kumar@intel.com>
> ---
>   opencl/compute_increment_kernel.cl | 6 ++++++
>   1 file changed, 6 insertions(+)
>   create mode 100644 opencl/compute_increment_kernel.cl
>
> diff --git a/opencl/compute_increment_kernel.cl b/opencl/compute_increment_kernel.cl
> new file mode 100644
> index 000000000..976c5a338
> --- /dev/null
> +++ b/opencl/compute_increment_kernel.cl
> @@ -0,0 +1,6 @@
> +__kernel void square(__global float* input,

input is not used. With that removed,

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

>   __global float* output, const unsigned int count) {
> +  int i = get_global_id(0);
> +  for (int j = 0; j < count ; j++) {
> +    output[i] = output[i] + 1;
> +   }
> +}
--------------JorFaihiKQWGSvLrokqzTYu3
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
    <div class="moz-cite-prefix">On 1/16/2024 10:27 PM,
      <a class="moz-txt-link-abbreviated" href="mailto:janga.rahul.kumar@intel.com">janga.rahul.kumar@intel.com</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240116212756.2687603-2-janga.rahul.kumar@intel.com">
      <pre class="moz-quote-pre" wrap="">From: Janga Rahul Kumar <a class="moz-txt-link-rfc2396E" href="mailto:janga.rahul.kumar@intel.com">&lt;janga.rahul.kumar@intel.com&gt;</a>

Compute opencl increment kernel provided here is used in
xe_compute_preempt test.

Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
Signed-off-by: Janga Rahul Kumar <a class="moz-txt-link-rfc2396E" href="mailto:janga.rahul.kumar@intel.com">&lt;janga.rahul.kumar@intel.com&gt;</a>
---
 opencl/compute_increment_kernel.cl | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 opencl/compute_increment_kernel.cl

diff --git a/opencl/compute_increment_kernel.cl b/opencl/compute_increment_kernel.cl
new file mode 100644
index 000000000..976c5a338
--- /dev/null
+++ b/opencl/compute_increment_kernel.cl
@@ -0,0 +1,6 @@
+__kernel void square(__global float* input,</pre>
    </blockquote>
    <p>input is not used. With that removed, <br>
    </p>
    <p>Reviewed-by: <span
      style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
      class="hljs diff colorediffs language-diff">Nirmoy Das </span><a
      class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com"
      style="white-space: pre-wrap;">&lt;nirmoy.das@intel.com&gt;</a><span
      style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
      class="hljs diff colorediffs language-diff"></span></p>
    <blockquote type="cite"
      cite="mid:20240116212756.2687603-2-janga.rahul.kumar@intel.com">
      <pre class="moz-quote-pre" wrap=""> __global float* output, const unsigned int count) {
+  int i = get_global_id(0);
+  for (int j = 0; j &lt; count ; j++) {
+    output[i] = output[i] + 1;
+   }
+}
</pre>
    </blockquote>
  </body>
</html>

--------------JorFaihiKQWGSvLrokqzTYu3--


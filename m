Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <1516798260-11685-1-git-send-email-ankit.k.nautiyal@intel.com>
 <1516798260-11685-2-git-send-email-ankit.k.nautiyal@intel.com>
 <1518446057.7484.5.camel@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <4cf22f94-e60d-6a59-d938-5a6993789915@intel.com>
Date: Tue, 13 Feb 2018 16:39:43 +0530
MIME-Version: 1.0
In-Reply-To: <1518446057.7484.5.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_kms.c: modify
 kmstest_dump_mode to print aspect ratio of a mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0898800256=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Kahola, Mika" <mika.kahola@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0898800256==
Content-Type: multipart/alternative;
 boundary="------------107ACFA33290D3887398E25A"

This is a multi-part message in MIME format.
--------------107ACFA33290D3887398E25A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mika,

Thanks for the review.

Please find my comments inline:


On 2/12/2018 8:04 PM, Kahola, Mika wrote:
> On Wed, 2018-01-24 at 18:20 +0530, Nautiyal, Ankit K wrote:
>> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>
>> This patch adds the support to print the aspect ratio of the modes
>> (if provided) along with other mode information.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   lib/igt_kms.c | 31 +++++++++++++++++++++++++++++--
>>   1 file changed, 29 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index eb57f4a..585f94d 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -56,6 +56,14 @@
>>   #include "igt_sysfs.h"
>>   #include "sw_sync.h"
>>   
>> +#ifndef DRM_MODE_FLAG_PIC_AR_64_27
>> +#define DRM_MODE_FLAG_PIC_AR_64_27 (3<<19)
>> +#endif
>> +
>> +#ifndef DRM_MODE_FLAG_PIC_AR_256_135
>> +#define DRM_MODE_FLAG_PIC_AR_256_135 (4<<19)
>> +#endif
>> +
> Shouldn't these be defined in /include/uapi/drm/drm_mode.h? Although, I
> wasn't able to find these definitions from that file. Do we have a
> patch under review in drm to fill this gap?

Yes you are right. These macros are introduced in the drm-devel 
patch-series to add aspect-ratio
support in drm layer.
https://patchwork.freedesktop.org/series/33984/ which is under review.

When the kernel patch gets r-b, I will remove these macros from here and 
submit
next patchset for this series.

Regards,
Ankit
>
> Otherwise, the patch looks good.
>
> Acked-by: Mika Kahola <mika.kahola@intel.com>
>
>>   /**
>>    * SECTION:igt_kms
>>    * @short_description: Kernel modesetting support library
>> @@ -491,6 +499,22 @@ static const char *mode_stereo_name(const
>> drmModeModeInfo *mode)
>>   	}
>>   }
>>   
>> +static const char *mode_aspect_name(const drmModeModeInfo *mode)
>> +{
>> +	switch (mode->flags & DRM_MODE_FLAG_PIC_AR_MASK) {
>> +	case DRM_MODE_FLAG_PIC_AR_4_3:
>> +		return "4:3";
>> +	case DRM_MODE_FLAG_PIC_AR_16_9:
>> +		return "16:9";
>> +	case DRM_MODE_FLAG_PIC_AR_64_27:
>> +		return "64:27";
>> +	case DRM_MODE_FLAG_PIC_AR_256_135:
>> +		return "256:135";
>> +	default:
>> +		return NULL;
>> +	}
>> +}
>> +
>>   /**
>>    * kmstest_dump_mode:
>>    * @mode: libdrm mode structure
>> @@ -500,8 +524,9 @@ static const char *mode_stereo_name(const
>> drmModeModeInfo *mode)
>>   void kmstest_dump_mode(drmModeModeInfo *mode)
>>   {
>>   	const char *stereo = mode_stereo_name(mode);
>> +	const char *aspect_ratio = mode_aspect_name(mode);
>>   
>> -	igt_info("  %s %d %d %d %d %d %d %d %d %d 0x%x 0x%x
>> %d%s%s%s\n",
>> +	igt_info("  %s %d %d %d %d %d %d %d %d %d 0x%x 0x%x %d%s%s%s
>> %s%s%s\n",
>>   		 mode->name, mode->vrefresh,
>>   		 mode->hdisplay, mode->hsync_start,
>>   		 mode->hsync_end, mode->htotal,
>> @@ -509,7 +534,9 @@ void kmstest_dump_mode(drmModeModeInfo *mode)
>>   		 mode->vsync_end, mode->vtotal,
>>   		 mode->flags, mode->type, mode->clock,
>>   		 stereo ? " (3D:" : "",
>> -		 stereo ? stereo : "", stereo ? ")" : "");
>> +		 stereo ? stereo : "", stereo ? ")" : "",
>> +		 aspect_ratio ? " (Pixel Aspect Ratio:" : "",
>> +		 aspect_ratio ? aspect_ratio : "", aspect_ratio ?
>> ")" : "");
>>   }
>>   
>>   /**


--------------107ACFA33290D3887398E25A
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><font size="-1">Hi Mika,<br>
      </font></p>
    <p><font size="-1">Thanks for the review.</font></p>
    <p><font size="-1">Please find my comments inline:</font><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2/12/2018 8:04 PM, Kahola, Mika
      wrote:<br>
    </div>
    <blockquote cite="mid:1518446057.7484.5.camel@intel.com" type="cite">
      <pre wrap="">On Wed, 2018-01-24 at 18:20 +0530, Nautiyal, Ankit K wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">From: Ankit Nautiyal <a class="moz-txt-link-rfc2396E" href="mailto:ankit.k.nautiyal@intel.com">&lt;ankit.k.nautiyal@intel.com&gt;</a>

This patch adds the support to print the aspect ratio of the modes
(if provided) along with other mode information.

Signed-off-by: Ankit Nautiyal <a class="moz-txt-link-rfc2396E" href="mailto:ankit.k.nautiyal@intel.com">&lt;ankit.k.nautiyal@intel.com&gt;</a>
---
 lib/igt_kms.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index eb57f4a..585f94d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -56,6 +56,14 @@
 #include "igt_sysfs.h"
 #include "sw_sync.h"
 
+#ifndef DRM_MODE_FLAG_PIC_AR_64_27
+#define DRM_MODE_FLAG_PIC_AR_64_27 (3&lt;&lt;19)
+#endif
+
+#ifndef DRM_MODE_FLAG_PIC_AR_256_135
+#define DRM_MODE_FLAG_PIC_AR_256_135 (4&lt;&lt;19)
+#endif
+
</pre>
      </blockquote>
      <pre wrap="">Shouldn't these be defined in /include/uapi/drm/drm_mode.h? Although, I
wasn't able to find these definitions from that file. Do we have a
patch under review in drm to fill this gap?</pre>
    </blockquote>
    <br>
    <font size="-1">Yes you are right. These macros are introduced in
      the drm-devel patch-series to add aspect-ratio<br>
      support in drm layer.<br>
      <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/33984/">https://patchwork.freedesktop.org/series/33984/</a> which is under
      review.<br>
      <br>
      When the kernel patch gets r-b, I will remove these macros from
      here and submit <br>
      next patchset for this series.<br>
      <br>
      Regards,<br>
      Ankit</font><br>
    <blockquote cite="mid:1518446057.7484.5.camel@intel.com" type="cite">
      <pre wrap="">

Otherwise, the patch looks good.

Acked-by: Mika Kahola <a class="moz-txt-link-rfc2396E" href="mailto:mika.kahola@intel.com">&lt;mika.kahola@intel.com&gt;</a>

</pre>
      <blockquote type="cite">
        <pre wrap=""> /**
  * SECTION:igt_kms
  * @short_description: Kernel modesetting support library
@@ -491,6 +499,22 @@ static const char *mode_stereo_name(const
drmModeModeInfo *mode)
 	}
 }
 
+static const char *mode_aspect_name(const drmModeModeInfo *mode)
+{
+	switch (mode-&gt;flags &amp; DRM_MODE_FLAG_PIC_AR_MASK) {
+	case DRM_MODE_FLAG_PIC_AR_4_3:
+		return "4:3";
+	case DRM_MODE_FLAG_PIC_AR_16_9:
+		return "16:9";
+	case DRM_MODE_FLAG_PIC_AR_64_27:
+		return "64:27";
+	case DRM_MODE_FLAG_PIC_AR_256_135:
+		return "256:135";
+	default:
+		return NULL;
+	}
+}
+
 /**
  * kmstest_dump_mode:
  * @mode: libdrm mode structure
@@ -500,8 +524,9 @@ static const char *mode_stereo_name(const
drmModeModeInfo *mode)
 void kmstest_dump_mode(drmModeModeInfo *mode)
 {
 	const char *stereo = mode_stereo_name(mode);
+	const char *aspect_ratio = mode_aspect_name(mode);
 
-	igt_info("  %s %d %d %d %d %d %d %d %d %d 0x%x 0x%x
%d%s%s%s\n",
+	igt_info("  %s %d %d %d %d %d %d %d %d %d 0x%x 0x%x %d%s%s%s
%s%s%s\n",
 		 mode-&gt;name, mode-&gt;vrefresh,
 		 mode-&gt;hdisplay, mode-&gt;hsync_start,
 		 mode-&gt;hsync_end, mode-&gt;htotal,
@@ -509,7 +534,9 @@ void kmstest_dump_mode(drmModeModeInfo *mode)
 		 mode-&gt;vsync_end, mode-&gt;vtotal,
 		 mode-&gt;flags, mode-&gt;type, mode-&gt;clock,
 		 stereo ? " (3D:" : "",
-		 stereo ? stereo : "", stereo ? ")" : "");
+		 stereo ? stereo : "", stereo ? ")" : "",
+		 aspect_ratio ? " (Pixel Aspect Ratio:" : "",
+		 aspect_ratio ? aspect_ratio : "", aspect_ratio ?
")" : "");
 }
 
 /**
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------107ACFA33290D3887398E25A--

--===============0898800256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0898800256==--

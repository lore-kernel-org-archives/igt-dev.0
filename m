Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AD810E072
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jul 2023 10:17:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------8TxquYcxs2w6qxML8a00K435"
Message-ID: <74f54cd8-cbeb-a97f-9af1-4b64072ad2d6@intel.com>
Date: Tue, 25 Jul 2023 15:46:19 +0530
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230718121443.445343-1-kunal1.joshi@intel.com>
 <20230718121443.445343-3-kunal1.joshi@intel.com>
 <20230720100245.2lref6sw6j7btr7k@zkempczy-mobl2>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20230720100245.2lref6sw6j7btr7k@zkempczy-mobl2>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/igt_fb: on xe driver switch
 from rendercopy to blitcopy
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--------------8TxquYcxs2w6qxML8a00K435
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 7/20/2023 3:32 PM, Zbigniew Kempczyński wrote:
> On Tue, Jul 18, 2023 at 05:44:43PM +0530, Kunal Joshi wrote:
>> on xe driver use blitcopy for everything where otherwise would
>> use rendercopy.
>>
>> Signed-off-by: Juha-Pekka Heikkila<juhapekka.heikkila@gmail.com>
>> ---
>>   lib/igt_fb.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>> index 6ce4b735a..f4bc800fe 100644
>> --- a/lib/igt_fb.c
>> +++ b/lib/igt_fb.c
>> @@ -2529,7 +2529,7 @@ static bool use_enginecopy(const struct igt_fb *fb)
>>   	if (!is_intel_device(fb->fd))
>>   		return false;
>>   
>> -	if (!is_xe_device(fb->fd) && blitter_ok(fb))
>> +	if (blitter_ok(fb))
>>   		return false;
> I stared to this and for me it looks we disable rendercopy at all
> for i915 as well for xe even if rendercopy is same for i915 and xe
> (intel-bb should handle this).
>
> --
> Zbigniew
>
Hello Zbigniew,

Blitter is preferred over render copy for perf/power and render copy is  
preferred for feature.
JP's changes are considering that fact. With this info does this patch 
look good?

Thanks and Regards
Kunal Joshi


--------------8TxquYcxs2w6qxML8a00K435
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/20/2023 3:32 PM, Zbigniew
      Kempczyński wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230720100245.2lref6sw6j7btr7k@zkempczy-mobl2">
      <pre class="moz-quote-pre" wrap="">On Tue, Jul 18, 2023 at 05:44:43PM +0530, Kunal Joshi wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">on xe driver use blitcopy for everything where otherwise would
use rendercopy.

Signed-off-by: Juha-Pekka Heikkila <a class="moz-txt-link-rfc2396E" href="mailto:juhapekka.heikkila@gmail.com">&lt;juhapekka.heikkila@gmail.com&gt;</a>
---
 lib/igt_fb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 6ce4b735a..f4bc800fe 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2529,7 +2529,7 @@ static bool use_enginecopy(const struct igt_fb *fb)
 	if (!is_intel_device(fb-&gt;fd))
 		return false;
 
-	if (!is_xe_device(fb-&gt;fd) &amp;&amp; blitter_ok(fb))
+	if (blitter_ok(fb))
 		return false;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I stared to this and for me it looks we disable rendercopy at all
for i915 as well for xe even if rendercopy is same for i915 and xe
(intel-bb should handle this).

--
Zbigniew

</pre>
    </blockquote>
    Hello Zbigniew,<br>
    <br>
    Blitter is preferred over render copy for perf/power and render copy
    is&nbsp; preferred for feature.<br>
    JP's changes are considering that fact. With this info does this
    patch look good?<br>
    <br>
    Thanks and Regards<br>
    Kunal Joshi
    <p><span><span class="ui-provider fz b c d e f g h i j k l m n o p q
          r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr"><br>
        </span></span><span><span class="ui-provider fz b c d e f g h i
          j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr"></span></span></p>
  </body>
</html>

--------------8TxquYcxs2w6qxML8a00K435--

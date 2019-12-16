Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20191216093433.2517697-1-chris@chris-wilson.co.uk>
 <3b79edfe-673a-9cb7-d8a0-7bf5b54748c8@intel.com>
 <157649017142.2285.5855880084447200659@skylake-alporthouse-com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <24ba122e-1213-f230-86b5-152b916833b3@intel.com>
Date: Mon, 16 Dec 2019 12:06:53 +0200
MIME-Version: 1.0
In-Reply-To: <157649017142.2285.5855880084447200659@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915/perf: Skip OA testing on systems
 too old
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0585279402=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0585279402==
Content-Type: multipart/alternative;
 boundary="------------6685D1F28E51F72D93A8B5BE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------6685D1F28E51F72D93A8B5BE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/12/2019 11:56, Chris Wilson wrote:
> Quoting Lionel Landwerlin (2019-12-16 09:46:56)
>> On 16/12/2019 11:34, Chris Wilson wrote:
>>> Don't flat out fail if the system doesn't support OA, just skip.
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/intel/issues/834
>>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>>> ---
>>>    tests/perf.c | 4 +---
>>>    1 file changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/tests/perf.c b/tests/perf.c
>>> index f5dd6051e..12f552743 100644
>>> --- a/tests/perf.c
>>> +++ b/tests/perf.c
>>> @@ -884,11 +884,9 @@ init_sys_info(void)
>>>        const char *test_set_uuid = NULL;
>>>        char buf[256];
>>>    
>>> -     igt_assert_neq(devid, 0);
>>> -
>>>        timestamp_frequency = get_cs_timestamp_frequency();
>>>        igt_debug("timestamp_frequency = %lu\n", timestamp_frequency);
>>> -     igt_assert_neq(timestamp_frequency, 0);
>>> +     igt_require(timestamp_frequency);
>>
>> This requires a kernel version more recent (4.16) than when perf support
>> was added (4.13).
>>
>> Is this what you intended?
> You have a fatal assert there. I am just changing it so that it skips
> when not supported as no testing is being performed.
> -Chris

I think there might be a problem in i915 if this returns 0.

When I added this param I went back and figured the value for each platform.

What kind of machine is fi-blb-e6850 
<https://intel-gfx-ci.01.org/hardware.html#fi-blb-e6850>? The number 
looks like a skylake.


-Lionel


--------------6685D1F28E51F72D93A8B5BE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 16/12/2019 11:56, Chris Wilson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:157649017142.2285.5855880084447200659@skylake-alporthouse-com">
      <pre class="moz-quote-pre" wrap="">Quoting Lionel Landwerlin (2019-12-16 09:46:56)
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 16/12/2019 11:34, Chris Wilson wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Don't flat out fail if the system doesn't support OA, just skip.

Closes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/intel/issues/834">https://gitlab.freedesktop.org/drm/intel/issues/834</a>
Signed-off-by: Chris Wilson <a class="moz-txt-link-rfc2396E" href="mailto:chris@chris-wilson.co.uk">&lt;chris@chris-wilson.co.uk&gt;</a>
---
  tests/perf.c | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/perf.c b/tests/perf.c
index f5dd6051e..12f552743 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -884,11 +884,9 @@ init_sys_info(void)
      const char *test_set_uuid = NULL;
      char buf[256];
  
-     igt_assert_neq(devid, 0);
-
      timestamp_frequency = get_cs_timestamp_frequency();
      igt_debug("timestamp_frequency = %lu\n", timestamp_frequency);
-     igt_assert_neq(timestamp_frequency, 0);
+     igt_require(timestamp_frequency);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">

This requires a kernel version more recent (4.16) than when perf support 
was added (4.13).

Is this what you intended?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You have a fatal assert there. I am just changing it so that it skips
when not supported as no testing is being performed.
-Chris
</pre>
    </blockquote>
    <p>I think there might be a problem in i915 if this returns 0.</p>
    <p>When I added this param I went back and figured the value for
      each platform.</p>
    <p>What kind of machine is <a
        href="https://intel-gfx-ci.01.org/hardware.html#fi-blb-e6850"
        style="font-family: Roboto, Oxygen-Sans, Ubuntu, Cantarell,
        sans-serif; font-size: medium; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(238, 238,
        238);">fi-blb-e6850</a>? The number looks like a skylake.<br>
    </p>
    <p><br>
    </p>
    <p>-Lionel<br>
    </p>
  </body>
</html>

--------------6685D1F28E51F72D93A8B5BE--

--===============0585279402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0585279402==--

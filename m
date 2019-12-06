Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B58F6F9EE
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2019 13:11:11 +0000 (UTC)
References: <20191120000800.16281-1-umesh.nerlige.ramappa@intel.com>
 <20191120000800.16281-3-umesh.nerlige.ramappa@intel.com>
 <609f3846-d778-6858-fba1-c446b6db353e@intel.com>
 <20191121172625.GA68520@orsosgc001.amr.corp.intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <edbcd3d7-47df-504a-977a-4fea6767c217@intel.com>
Date: Fri, 6 Dec 2019 15:11:09 +0200
MIME-Version: 1.0
In-Reply-To: <20191121172625.GA68520@orsosgc001.amr.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v4 3/4] test/perf: Add test for TGL OAR
 unit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0450836843=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0450836843==
Content-Type: multipart/alternative;
 boundary="------------466189D2943C2BBC4B4618B4"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------466189D2943C2BBC4B4618B4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2019 19:26, Umesh Nerlige Ramappa wrote:
>>
>>
>> What delta do you see for the context that is not given to i915-perf?
>
> no delta and also all counters are zeroes. The above 2 memcmp check 
> that all counters are zeroes.
>
> Thanks,
> Umesh
>
Thanks for pointing this out : Reviewed-by: Lionel Landwerlin 
<lionel.g.landwerlin@intel.com>


--------------466189D2943C2BBC4B4618B4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 21/11/2019 19:26, Umesh Nerlige
      Ramappa wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20191121172625.GA68520@orsosgc001.amr.corp.intel.com">
      <blockquote type="cite" style="color: #000000;"><br>
        <br>
        What delta do you see for the context that is not given to
        i915-perf?
        <br>
      </blockquote>
      <br>
      no delta and also all counters are zeroes. The above 2 memcmp
      check that all counters are zeroes.
      <br>
      <br>
      Thanks,
      <br>
      Umesh
      <br>
      <br>
      <blockquote type="cite" style="color: #000000;">
      </blockquote>
    </blockquote>
    <p>Thanks for pointing this out : Reviewed-by: Lionel Landwerlin
      <a class="moz-txt-link-rfc2396E" href="mailto:lionel.g.landwerlin@intel.com">&lt;lionel.g.landwerlin@intel.com&gt;</a><br>
    </p>
  </body>
</html>

--------------466189D2943C2BBC4B4618B4--

--===============0450836843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0450836843==--

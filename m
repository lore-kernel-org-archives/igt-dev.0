Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B886E218
 for <igt-dev@lists.freedesktop.org>; Tue, 15 May 2018 13:39:54 +0000 (UTC)
References: <20180515092243.22374-1-lionel.g.landwerlin@intel.com>
 <152638934184.18532.10324735277798819712@mail.alporthouse.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <3a94a96b-a7f7-eee6-a641-9298479fb1ed@intel.com>
Date: Tue, 15 May 2018 14:39:51 +0100
MIME-Version: 1.0
In-Reply-To: <152638934184.18532.10324735277798819712@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] intel: deviceinfo: split CNL pciids
 into GT1/2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0652018083=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0652018083==
Content-Type: multipart/alternative;
 boundary="------------26BC49A138C2BF4C8F3DB469"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------26BC49A138C2BF4C8F3DB469
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/05/18 14:02, Chris Wilson wrote:
>> -       INTEL_VGA_DEVICE(0x5A44, info), \
>> -       INTEL_VGA_DEVICE(0x5A4C, info)
>> +       INTEL_VGA_DEVICE(0x5A5C, info)
> Kernel commit sha for the above? -Chris 
Apologies, I forgot those 2 were synced.

-
Lionel

--------------26BC49A138C2BF4C8F3DB469
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 15/05/18 14:02, Chris Wilson wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:152638934184.18532.10324735277798819712@mail.alporthouse.com">
      <blockquote type="cite" style="color: #000000;">
        <pre wrap="">-       INTEL_VGA_DEVICE(0x5A44, info), \
-       INTEL_VGA_DEVICE(0x5A4C, info)
+       INTEL_VGA_DEVICE(0x5A5C, info)
</pre>
      </blockquote>
      Kernel commit sha for the above?
      -Chris
    </blockquote>
    Apologies, I forgot those 2 were synced.<br>
    <br>
    -<br>
    Lionel<br>
  </body>
</html>

--------------26BC49A138C2BF4C8F3DB469--

--===============0652018083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0652018083==--

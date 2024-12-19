Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A78E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 08:44:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EDA410E48B;
	Thu, 19 Dec 2024 08:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KwIGtSEM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E4C10E48B
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 08:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734597889; x=1766133889;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=5uaBkQN71L7d4B9sgHmFRJ02olHYw4brQpdOc980FYk=;
 b=KwIGtSEMTXBjjrQvn3nUUaWfwe/NkQv/2yuredg2jjOtBpddsvC4jN2b
 CoorF1eIgz7pdjohZ559JDANiDywUtTW3zZRF67uMPsSzaVYWjZYgEq4i
 neLiI/X7z0r/i/cbSvh5tIUFKS0/GI4l4vIcMJpI0wIs6+81mmnbaXOQJ
 0Ew/66Fxu2Z93DiE3b+TYqYE8euejQy0phSGbJPxYv3IyBaqmX2dND1gw
 BXDwthTu11oY55b6nHPYnskB1QeOvcs5P/JCa3IzrJCD40EC0K/T8lRvg
 4mT7jsriijwS4zIlgOkScGvwk6zigVn52R1iAD22t9Iwx1s/Z0z49nuEo A==;
X-CSE-ConnectionGUID: I1eGsRfGTdaKYxbbzJ3leg==
X-CSE-MsgGUID: pMMLwMfITm20RlVdAAa5sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35227798"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="35227798"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 00:44:35 -0800
X-CSE-ConnectionGUID: 8AR6+mv4Tw6RHHHB384PqQ==
X-CSE-MsgGUID: utiSP2SIQS+SxevCGG3Xjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121401163"
Received: from fprasadx-mobl1.amr.corp.intel.com (HELO [10.212.73.149])
 ([10.212.73.149])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 00:44:34 -0800
Content-Type: multipart/mixed; boundary="------------vQ27Q7JED6v4gMKo7cF9tfrh"
Message-ID: <f1c12cc0-dbd8-428a-82d9-dede1e6f4164@linux.intel.com>
Date: Thu, 19 Dec 2024 09:44:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/4] Device scan fixes
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20241218051324.2696557-1-lucas.demarchi@intel.com>
 <4f4cb4c0-317c-4b5a-a37a-c30dd1be57c9@linux.intel.com>
 <3izfilgj2eycb4fvdudz62wxq6fwarehczg5z75qpbo7l5xxvk@zdh4xgda2npo>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <3izfilgj2eycb4fvdudz62wxq6fwarehczg5z75qpbo7l5xxvk@zdh4xgda2npo>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------vQ27Q7JED6v4gMKo7cF9tfrh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Lucas,

On 18.12.2024 23:04, Lucas De Marchi wrote:
> On Wed, Dec 18, 2024 at 09:16:48AM +0100, Peter Senna Tschudin wrote:
>>
>>
>> On 18.12.2024 06:13, Lucas De Marchi wrote:
>>> This started with the goal of fixing xe_wedged (besides the fix to the
>>> kernel that is in flight), however the issue of device "disappearing
>>> from bus" looks similar to several other issues we occasionally have -
>>> it may be the same issue. Try to fix it by forcing scans.
>>
>> Is the hypothesis that while an IGT test is running something may
>> break the association between GPU and device node? I am asking because
>> the drm device is always closed after a test ends.
> 
> it depends what the test is doing, if the fd is closed etc... note that
> multiple subtests are executed without runing a new program. Even some
> under-the-hood behavior that we have with e.g. i915 (it keeps an fd open
> a dup fd open) may change the behavior if you load/unload or
> bind/unbind. Example:
> 
> RPL (00:02.0) + BMG (03:00.0)
>     # ./build/tools/lsgpu                                       card1                    Intel Battlemage (Gen20)          drm:/dev/dri/card1           └─renderD129                                               drm:/dev/dri/renderD129      card0                    Intel Raptorlake_s (Gen12)        drm:/dev/dri/card0           └─renderD128                                               drm:/dev/dri/renderD128 
>     # ls -l /dev/dri/by-path/                               total 0                                                                             lrwxrwxrwx 1 root root  8 Dec 18 19:39 pci-0000:00:02.0-card -> ../card0
>     lrwxrwxrwx 1 root root 13 Dec 18 19:39 pci-0000:00:02.0-render -> ../renderD128
>     lrwxrwxrwx 1 root root  8 Dec 18 19:39 pci-0000:03:00.0-card -> ../card1
>     lrwxrwxrwx 1 root root 13 Dec 18 19:39 pci-0000:03:00.0-render -> ../renderD129
> Rebind RPL:
>     # echo 0000:00:02.0 | sudo tee /sys/bus/pci/drivers/xe/unbind
>     # echo 0000:00:02.0 | sudo tee /sys/bus/pci/drivers/xe/bind
> 
>     # ls -l /dev/dri/by-path/
>     total 0
>     lrwxrwxrwx 1 root root  8 Dec 18 19:40 pci-0000:00:02.0-card -> ../card0
>     lrwxrwxrwx 1 root root 13 Dec 18 19:40 pci-0000:00:02.0-render -> ../renderD128
>     lrwxrwxrwx 1 root root  8 Dec 18 19:39 pci-0000:03:00.0-card -> ../card1
>     lrwxrwxrwx 1 root root 13 Dec 18 19:39 pci-0000:03:00.0-render -> ../renderD129
> 
> Great, nothing break, right?
> 
> Rebind both in a different order (shouldn't happen if both cards are
> backed by the same module, but can perfectly happen in a i915 + xe
> scenario as the modules may be ready in different order):
> 
>     # echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/unbind     # echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind     # echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind     # echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/bind     # ls -l /dev/dri/by-path/
>     total 0
>     lrwxrwxrwx 1 root root  8 Dec 18 19:41 pci-0000:00:02.0-card -> ../card1
>     lrwxrwxrwx 1 root root 13 Dec 18 19:41 pci-0000:00:02.0-render -> ../renderD129
>     lrwxrwxrwx 1 root root  8 Dec 18 19:41 pci-0000:03:00.0-card -> ../card0
>     lrwxrwxrwx 1 root root 13 Dec 18 19:41 pci-0000:03:00.0-render -> ../renderD128
> 
> Simulate one thing that may happen in igt: but leak an fd:
> 
>     # exec 3<>  /dev/dri/by-path/pci-0000:03:00.0-card
>     # echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind     # echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind     # echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
>     # ls -l /dev/dri/by-path/
>     total 0
>     lrwxrwxrwx 1 root root  8 Dec 18 19:41 pci-0000:00:02.0-card -> ../card1
>     lrwxrwxrwx 1 root root 13 Dec 18 19:41 pci-0000:00:02.0-render -> ../renderD129
>     lrwxrwxrwx 1 root root  8 Dec 18 19:42 pci-0000:03:00.0-card -> ../card2
>     lrwxrwxrwx 1 root root 13 Dec 18 19:42 pci-0000:03:00.0-render -> ../renderD130
> 
> So... because we had and fd open, now it became card2 rather than 1.
> Also note that simply calling close(fd) in igt doesn't work as the
> cached fds will throw igt through the wrong path.
> 
> So.... instead of adding bandaid everywhere in igt, I think we should
> fix the design to stop caching the wrong thing. IMO a first step would
> be "disable the cache and see how much it impacts".
> 
> Lucas De Marchi
> 
>>
>> I tested this by printing the value of _opened_fds_count from
>> lib/drmtest.c before each test, and the value is always 0.
>>
>> _opened_fds_count being zero means that the cache is empty, right? So
>> if the cache is empty before each test starts, under which conditions
>> can the potential problem manifest?


I could finally detect the issue by(The patch should be applied on top of my facts series):
 - Creating peter_drm_stats(): prints drm cache entries with fd and card number
 - Instrumenting igt@core_hotunplug@hotrebind with calls to igt_facts() and peter_drm_stats()

My goal is to create a test for us to test possible fixes. Can you help me creating a test that
is more meaningful for us to use as benchmark? See the output:

Starting subtest: hotrebind
...
[5147.892783] [FACT Before it starts] new: hardware.pci.drm_card_at_addr.0000:03:00.0: card1
[5147.897991] [DRM_CACHE] Before it starts: fd 5, card: 1
[5148.968237] [DRM_CACHE] After local_drm_open_driver(): fd 5, card: 1
Unloaded audio driver snd_hda_intel
Realoading snd_hda_intel
[5150.025062] [FACT After driver_unbind() and driver_bind()] changed: hardware.pci.drm_card_at_addr.0000:03:00.0: card1 -> card0

// Here the cache is wrong
[5150.030141] [DRM_CACHE] After driver_unbind() and driver_bind(): fd 5, card: 1

Opened device: \/dev\/dri\/card0
Opened device: \/dev\/dri\/renderD128

// healthcheck() fixes the cache by calling igt_devices_scan(true)
[5151.100086] [DRM_CACHE] After healthcheck(): fd 8, card: 0

Subtest hotrebind: SUCCESS (3.227s)

--------------vQ27Q7JED6v4gMKo7cF9tfrh
Content-Type: text/plain; charset=UTF-8; name="debug.patch"
Content-Disposition: attachment; filename="debug.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2xpYi9kcm10ZXN0LmMgYi9saWIvZHJtdGVzdC5jCmluZGV4IDJkZDQ1
NDBiOC4uNmI3YzM1ZTIwIDEwMDY0NAotLS0gYS9saWIvZHJtdGVzdC5jCisrKyBiL2xpYi9k
cm10ZXN0LmMKQEAgLTM1LDYgKzM1LDcgQEAKICNpbmNsdWRlIDxzeXMvaW9jdGwuaD4KICNp
bmNsdWRlIDxzdHJpbmcuaD4KICNpbmNsdWRlIDxzeXMvbW1hbi5oPgorI2luY2x1ZGUgPHN5
cy9zeXNtYWNyb3MuaD4KICNpbmNsdWRlIDxzaWduYWwuaD4KICNpbmNsdWRlIDxwY2lhY2Nl
c3MuaD4KICNpbmNsdWRlIDxzdGRsaWIuaD4KQEAgLTQxOCw2ICs0MTksMzMgQEAgc3RhdGlj
IGJvb2wgX2lzX2FscmVhZHlfb3BlbmVkKGNvbnN0IGNoYXIgKnBhdGgsIGludCBhc19pZHgp
CiAJcmV0dXJuIGZhbHNlOwogfQogCit2b2lkIHBldGVyX2RybV9zdGF0cyhjb25zdCBjaGFy
ICptc2cpCit7CisJc3RydWN0IHRpbWVzcGVjIHVwdGltZV90czsKKwljaGFyICp1cHRpbWUg
PSBOVUxMOworCisJaWYgKGNsb2NrX2dldHRpbWUoQ0xPQ0tfQk9PVFRJTUUsICZ1cHRpbWVf
dHMpICE9IDApCisJCXJldHVybjsKKworCWFzcHJpbnRmKCZ1cHRpbWUsCisJCSAiJWxkLiUw
NmxkIiwKKwkJIHVwdGltZV90cy50dl9zZWMsCisJCSB1cHRpbWVfdHMudHZfbnNlYyAvIDEw
MDApOworCisJZm9yIChpbnQgaSA9IDA7IGkgPCBfb3BlbmVkX2Zkc19jb3VudDsgaSsrKSB7
CisJCXVuc2lnbmVkIGxvbmcgaW50IHN0X3JkZXY7CisJCWludCBmZCwgY2FyZDsKKwkJZmQg
PSBfb3BlbmVkX2Zkc1tpXS5mZDsKKwkJc3RfcmRldiA9IF9vcGVuZWRfZmRzW2ldLnN0YXQu
c3RfcmRldjsKKwkJY2FyZCA9ICBnbnVfZGV2X21pbm9yKHN0X3JkZXYpOworCQlpZ3RfaW5m
bygiWyVzXSBbRFJNX0NBQ0hFXSAlczogZmQgJWQsIGNhcmQ6ICVkXG4iLAorCQkJIHVwdGlt
ZSwKKwkJCSBtc2cgPyBtc2cgOiAiIiwKKwkJCSBmZCwKKwkJCSBjYXJkKTsKKwl9Cit9CisK
IHN0YXRpYyBpbnQgX19zZWFyY2hfYW5kX29wZW4oY29uc3QgY2hhciAqYmFzZSwgaW50IG9m
ZnNldCwgdW5zaWduZWQgaW50IGNoaXBzZXQsIGludCBhc19pZHgpCiB7CiAJY29uc3QgY2hh
ciAqZm9yY2VkOwpkaWZmIC0tZ2l0IGEvbGliL2RybXRlc3QuaCBiL2xpYi9kcm10ZXN0LmgK
aW5kZXggMjdlNWExOGUyLi5kMzcxM2U5YjkgMTAwNjQ0Ci0tLSBhL2xpYi9kcm10ZXN0LmgK
KysrIGIvbGliL2RybXRlc3QuaApAQCAtMTQ1LDYgKzE0NSw3IEBAIGJvb2wgaXNfdmM0X2Rl
dmljZShpbnQgZmQpOwogYm9vbCBpc194ZV9kZXZpY2UoaW50IGZkKTsKIGJvb2wgaXNfaW50
ZWxfZGV2aWNlKGludCBmZCk7CiBlbnVtIGludGVsX2RyaXZlciBnZXRfaW50ZWxfZHJpdmVy
KGludCBmZCk7CitleHRlcm4gdm9pZCBwZXRlcl9kcm1fc3RhdHMoY29uc3QgY2hhciAqbXNn
KTsKIAogLyoqCiAgKiBkb19vcl9kaWU6CmRpZmYgLS1naXQgYS90ZXN0cy9jb3JlX2hvdHVu
cGx1Zy5jIGIvdGVzdHMvY29yZV9ob3R1bnBsdWcuYwppbmRleCA3ZjE3ZjQ0MjMuLjgzODQw
NGQ4YiAxMDA2NDQKLS0tIGEvdGVzdHMvY29yZV9ob3R1bnBsdWcuYworKysgYi90ZXN0cy9j
b3JlX2hvdHVucGx1Zy5jCkBAIC0zOSw2ICszOSw4IEBACiAjaW5jbHVkZSAiaWd0X2ttb2Qu
aCIKICNpbmNsdWRlICJpZ3Rfc3lzZnMuaCIKICNpbmNsdWRlICJzd19zeW5jLmgiCisjaW5j
bHVkZSAiaWd0X2ZhY3RzLmgiCisKIC8qKgogICogVEVTVDogY29yZSBob3R1bnBsdWcKICAq
IERlc2NyaXB0aW9uOiBFeGFtaW5lIGJlaGF2aW9yIG9mIGEgZHJpdmVyIG9uIGRldmljZSBo
b3QgdW5wbHVnCkBAIC02MTQsMTUgKzYxNiwyOSBAQCBzdGF0aWMgdm9pZCBob3R1bnBsdWdf
cmVzY2FuKHN0cnVjdCBob3R1bnBsdWcgKnByaXYpCiAKIHN0YXRpYyB2b2lkIGhvdHJlYmlu
ZChzdHJ1Y3QgaG90dW5wbHVnICpwcml2KQogeworCWlndF9mYWN0c19saXN0c19pbml0KCk7
CisKKwlpZ3RfZmFjdHMoIkJlZm9yZSBpdCBzdGFydHMiKTsKKwlwZXRlcl9kcm1fc3RhdHMo
IkJlZm9yZSBpdCBzdGFydHMiKTsKKwogCXByZV9jaGVjayhwcml2KTsKIAogCXByaXYtPmZk
LmRybSA9IGxvY2FsX2RybV9vcGVuX2RyaXZlcihmYWxzZSwgIiIsICIgZm9yIGhvdCByZWJp
bmQiKTsKIAorCWlndF9mYWN0cygiQWZ0ZXIgbG9jYWxfZHJtX29wZW5fZHJpdmVyKCkiKTsK
KwlwZXRlcl9kcm1fc3RhdHMoIkFmdGVyIGxvY2FsX2RybV9vcGVuX2RyaXZlcigpIik7CisK
IAlkcml2ZXJfdW5iaW5kKHByaXYsICJob3QgIiwgNjApOwogCiAJZHJpdmVyX2JpbmQocHJp
diwgMCk7CiAKKwlpZ3RfZmFjdHMoIkFmdGVyIGRyaXZlcl91bmJpbmQoKSBhbmQgZHJpdmVy
X2JpbmQoKSIpOworCXBldGVyX2RybV9zdGF0cygiQWZ0ZXIgZHJpdmVyX3VuYmluZCgpIGFu
ZCBkcml2ZXJfYmluZCgpIik7CisKIAlpZ3RfYXNzZXJ0X2YoaGVhbHRoY2hlY2socHJpdiwg
ZmFsc2UpLCAiJXNcbiIsIHByaXYtPmZhaWx1cmUpOworCisJaWd0X2ZhY3RzKCJBZnRlciBo
ZWFsdGhjaGVjaygpIik7CisJcGV0ZXJfZHJtX3N0YXRzKCJBZnRlciBoZWFsdGhjaGVjaygp
Iik7CiB9CiAKIHN0YXRpYyB2b2lkIGhvdHJlcGx1ZyhzdHJ1Y3QgaG90dW5wbHVnICpwcml2
KQo=

--------------vQ27Q7JED6v4gMKo7cF9tfrh--

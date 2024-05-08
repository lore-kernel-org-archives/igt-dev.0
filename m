Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4C5C04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 18:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1156010E530;
	Wed,  8 May 2024 18:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kSZ/I8WK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7067C10E530
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 18:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715193569; x=1746729569;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=8CyuiTlXoz58Qb/mjA12Fd9DSgytTY0qc43P7/bWJZQ=;
 b=kSZ/I8WKHeXbN51BukwQynduXm0VVRkgk6EsosND6jnJru9muW83zjnZ
 0A+JIyfVx0AwqPvoN2vajMstzQZLdBhAZoyCVe8Vzj1lNWHSnwQgmU1xC
 AHcN+s0LwzM7vWlfIHLCtEnvGh4jX0qV54NuL3+XkLUE5EiGio2tK123t
 ELC637ZTVZz4+mQc37q1Feo7HPS1IHS5b9v6Ayt9fqrgGnhmE01sASmK4
 0PdIDcszN+KdTuITmXjGlM8Q1EGtPhe3klg1dNMcVX3Tgiyjv6NRoVjSe
 OXGbNA68PBJBLyAyhIzr+cCk8aa3hxOGy8PEGnmZ7590o4MwHwbLYGCAN Q==;
X-CSE-ConnectionGUID: 9zMd8a/mSSOJd9AMYHZEIg==
X-CSE-MsgGUID: EXdCJ7xLROa/mFOT2Dxe+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="10926914"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="10926914"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 11:39:28 -0700
X-CSE-ConnectionGUID: BeJnlFnGQQu5oPo8yYIEag==
X-CSE-MsgGUID: 3YP5okPjScKGUbMeMghGqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33809680"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 11:39:28 -0700
Received: from [10.252.35.44] (10.252.35.44) by ORSMSX602.amr.corp.intel.com
 (10.22.229.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 8 May
 2024 11:39:26 -0700
Message-ID: <778e52d6-b3f8-4764-bd2b-1d3efd7912f9@intel.com>
Date: Wed, 8 May 2024 21:39:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_big_fb: Fix width calculation while
 creating the intel buf
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Vinod Govindapillai
 <vinod.govindapillai@intel.com>, <bhanuprakash.modem@intel.com>,
 <jani.saarinen@intel.com>
References: <20240507123026.57575-1-vinod.govindapillai@intel.com>
 <20240508151300.it6pnyauxeq6tyed@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>
In-Reply-To: <20240508151300.it6pnyauxeq6tyed@kamilkon-DESK.igk.intel.com>
X-Originating-IP: [10.252.35.44]
X-ClientProxiedBy: fmsmsx610.amr.corp.intel.com (10.18.126.90) To
 ORSMSX602.amr.corp.intel.com (10.22.229.15)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
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

QFZpbm9kLCBjYW4geW91IGFkZCBoZXJlIGNvbW1lbnQgdGhpcyBwYXRjaCBwYXJ0aWFsbHkgcmV2
ZXJ0IGNoYW5nZXMgCmRvbmUgaW4gYmZhM2RiMGNkOWU5YTExYzBlZWFmNDBhMjc0M2M1ZTJlMGYy
NGQyYwoKT24gOC41LjIwMjQgMTguMTMsIEthbWlsIEtvbmllY3pueSB3cm90ZToKPiBIaSBWaW5v
ZCwKPiBPbiAyMDI0LTA1LTA3IGF0IDE1OjMwOjI2ICswMzAwLCBWaW5vZCBHb3ZpbmRhcGlsbGFp
IHdyb3RlOgo+PiBGcm9tOiBCaGFudXByYWthc2ggTW9kZW0gPGJoYW51cHJha2FzaC5tb2RlbUBp
bnRlbC5jb20+Cj4+Cj4gCj4gUGxlYXNlIGFkZCBkZXNjcmlwdGlvbiBoZXJlLgo+IAo+IFJlZ2Fy
ZHMsCj4gS2FtaWwKPiAKPj4gU2lnbmVkLW9mZi1ieTogQmhhbnVwcmFrYXNoIE1vZGVtIDxiaGFu
dXByYWthc2gubW9kZW1AaW50ZWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBWaW5vZCBHb3ZpbmRh
cGlsbGFpIDx2aW5vZC5nb3ZpbmRhcGlsbGFpQGludGVsLmNvbT4KPj4gLS0tCj4+ICAgbGliL2ln
dF9kcmF3LmMgICAgICAgICAgIHwgMiArLQo+PiAgIHRlc3RzL2ludGVsL2ttc19iaWdfZmIuYyB8
IDIgKy0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPj4KPj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZHJhdy5jIGIvbGliL2lndF9kcmF3LmMKPj4g
aW5kZXggMmMwMWQ3YjAyLi45N2E3ZTZiMzcgMTAwNjQ0Cj4+IC0tLSBhL2xpYi9pZ3RfZHJhdy5j
Cj4+ICsrKyBiL2xpYi9pZ3RfZHJhdy5jCj4+IEBAIC02NTAsNyArNjUwLDcgQEAgc3RhdGljIHN0
cnVjdCBpbnRlbF9idWYgKmNyZWF0ZV9idWYoaW50IGZkLCBzdHJ1Y3QgYnVmX29wcyAqYm9wcywK
Pj4gICAJdWludDY0X3QgcmVnaW9uID0gZHJpdmVyID09IElOVEVMX0RSSVZFUl9YRSA/IHZyYW1f
aWZfcG9zc2libGUoZmQsIDApIDogLTE7Cj4+ICAgCXVpbnQ2NF90IHNpemUgPSBmcm9tLT5zaXpl
Owo+PiAgIAo+PiAtCXdpZHRoID0gZnJvbS0+d2lkdGg7Cj4+ICsJd2lkdGggPSBmcm9tLT5zdHJp
ZGUgLyAoZnJvbS0+YnBwIC8gOCk7Cj4+ICAgCWhlaWdodCA9IGZyb20tPmhlaWdodDsKPj4gICAJ
aWYgKGRyaXZlciA9PSBJTlRFTF9EUklWRVJfWEUpCj4+ICAgCQlzaXplID0gQUxJR04oc2l6ZSwg
eGVfZ2V0X2RlZmF1bHRfYWxpZ25tZW50KGZkKSk7Cj4+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRl
bC9rbXNfYmlnX2ZiLmMgYi90ZXN0cy9pbnRlbC9rbXNfYmlnX2ZiLmMKPj4gaW5kZXggZjdmMzAz
ZDQxLi4xZTQ1ZDhlNDIgMTAwNjQ0Cj4+IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19iaWdfZmIuYwo+
PiArKysgYi90ZXN0cy9pbnRlbC9rbXNfYmlnX2ZiLmMKPj4gQEAgLTE5OSw3ICsxOTksNyBAQCBz
dGF0aWMgc3RydWN0IGludGVsX2J1ZiAqaW5pdF9idWYoZGF0YV90ICpkYXRhLAo+PiAgIAl0aWxp
bmcgPSBpZ3RfZmJfbW9kX3RvX3RpbGluZyhmYi0+bW9kaWZpZXIpOwo+PiAgIAlicHAgPSBmYi0+
cGxhbmVfYnBwWzBdOwo+PiAgIAlzaXplID0gZmItPnNpemU7Cj4+IC0Jd2lkdGggPSBmYi0+d2lk
dGg7Cj4+ICsJd2lkdGggPSBmYi0+c3RyaWRlc1swXSAvIChicHAgLyA4KTsKPj4gICAJaGVpZ2h0
ID0gZmItPmhlaWdodDsKPj4gICAKPj4gICAJbmFtZSA9IGdlbV9mbGluayhkYXRhLT5kcm1fZmQs
IGZiLT5nZW1faGFuZGxlKTsKPj4gLS0gCj4+IDIuMzQuMQo+PgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSW50ZWwg
RmlubGFuZCBPeQpSZWdpc3RlcmVkIEFkZHJlc3M6IFBMIDI4MSwgMDAxODEgSGVsc2lua2kgCkJ1
c2luZXNzIElkZW50aXR5IENvZGU6IDAzNTc2MDYgLSA0IApEb21pY2lsZWQgaW4gSGVsc2lua2kg
CgpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlh
bCBtYXRlcmlhbCBmb3IKdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocyku
IEFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uCmJ5IG90aGVycyBpcyBzdHJpY3RseSBwcm9oaWJp
dGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQKcmVjaXBpZW50LCBwbGVhc2UgY29udGFj
dCB0aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGllcy4K


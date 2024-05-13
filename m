Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05328C25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 17:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947A510E411;
	Mon, 13 May 2024 17:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="geu7IvVK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A541D10E411
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 17:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715622143; x=1747158143;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Onxnnaw/N6DR578nXsxvztlhXFph+E0a6gGNZDRfpB8=;
 b=geu7IvVKgQFvpTcsHtM2lq4983DC8Dc2NRHvv8KCXfO0HTIrmgGbxTdp
 4xUt5pUkckHSvnEsok1Z2bABP1tIZ4A1tGB4GJAXgb18lsygY8fDCaxuh
 yfW/HiJQix6aCZ0J6oCr0PdnYyZ8z8vvYsHERpGins+mYYaXD39anvUck
 WMcRnqCm2EDJYzVarl0PpXYIQpseh0Sv82DBqt+QIBYnzBTuwHJQk5ow3
 Ob1AnVK3tfERkZUQpTIhK5Tmeaey5xEHxa59zp5qEtCPEH0u4VhuKd3pI
 dUbdbsa0kP2jLiblwc5aQV+xGMeWhql8NxyfClwm7sEukWcNP2ShS06uH w==;
X-CSE-ConnectionGUID: aWW5ZRfuQs+XCJRG1Hxnkw==
X-CSE-MsgGUID: AL/Rn4y8Q2WmQa78+X013A==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="22241227"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="22241227"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 10:42:22 -0700
X-CSE-ConnectionGUID: jM6tP8MqRMi2sNb86we67w==
X-CSE-MsgGUID: SKdZEV0eQk6fWc7FaXZmyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="34842310"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 10:42:22 -0700
Received: from [10.249.34.77] (10.249.34.77) by ORSMSX602.amr.corp.intel.com
 (10.22.229.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 13 May
 2024 10:42:19 -0700
Message-ID: <ba280272-81b2-4ae4-8c49-26c7a7578cdf@intel.com>
Date: Mon, 13 May 2024 20:42:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] lib/igt_kms: move setting
 DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, <adrinael@adrinael.net>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>
References: <20240510-wb_igt_fix-v2-1-e14eef87319b@quicinc.com>
 <20240513130930.supfmh4dfl2attph@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>
In-Reply-To: <20240513130930.supfmh4dfl2attph@kamilkon-DESK.igk.intel.com>
X-Originating-IP: [10.249.34.77]
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

CgpPbiAxMy41LjIwMjQgMTYuMDksIEthbWlsIEtvbmllY3pueSB3cm90ZToKPiBIaSBBYmhpbmF2
LAo+IE9uIDIwMjQtMDUtMTAgYXQgMTE6MDk6MzUgLTA3MDAsIEFiaGluYXYgS3VtYXIgd3JvdGU6
Cj4+IEN1cnJlbnRseSBEUk1fQ0xJRU5UX0NBUF9XUklURUJBQ0tfQ09OTkVDVE9SUyBpcyBzZXQg
aW4gdGhlIGlndF9kaXNwbGF5X3JlcXVpcmUoKQo+PiB3aGljaCBpcyBpbnZva2VkIGZvciBhbGwg
SUdUIHRlc3RzIGlycmVzcGVjdGl2ZSBvZiB3aGV0aGVyIHRoZSByZXN0IG9mIHRoZQo+PiB3cml0
ZWJhY2sgY29ubmVjdG9yIHByb3BlcnRpZXMgc3VjaCBhcyB0aGUgRkJfSUQgYXJlIHNldC4KPj4K
Pj4gRm9yIHRoZSB3cml0ZWJhY2sgY29ubmVjdG9ycyB0byBmdW5jdGlvbiBwcm9wZXJseSwgYWRk
aXRpb25hbCBzZXR1cCBzdGVwcyBhcmUKPj4gcmVxdWlyZWQgKGxpa2Ugc2V0dGluZyB1cCB0aGUg
b3V0cHV0IGJ1ZmZlcnMgYW5kIHN1Ym1pdHRpbmcgdGhlIGpvYikuIFRoZXNlIHN0ZXBzCj4+IGFy
ZSBub3QgYSBwYXJ0IG9mIHRoZSBkZWZhdWx0IElHVCBzZXR1cCwgc28gdGhlcmUgaXMgbm8gZ3Vh
cmFudGVlIHRoYXQgdGhlIHBpcGVsaW5lCj4+IHdpbGwgYmUgZXhlY3V0ZWQgYXQgYWxsLiBUaGlz
IHJlc3VsdHMgaW4gcmVncmVzc2lvbnMgZm9yIG1zbSBib2FyZHMgYWNyb3NzIG11bHRpcGxlCj4+
IElHVCB0ZXN0cyBvbiB3cml0ZWJhY2sgY29ubmVjdG9ycyBzdWNoIGFzIENUTSByZWxhdGVkIHRl
c3RzIHdoZXJlIENSQyBuZWVkcyB0bwo+PiBiZSBjb2xsZWN0ZWQgYWZ0ZXIgdGhlIENUTSBoYXMg
YmVlbiBhcHBsaWVkIGluIGhhcmR3YXJlLgo+Pgo+PiBJdCBpcyB1bmNsZWFyIHdoZXRoZXIgdGhp
cyBpcyBpbnRlbnRpb25hbCB0byBiZSBhYmxlIHRvIHJ1biBhbGwgSUdUIHRlc3RzIGV2ZW4KPj4g
d2l0aCB3cml0ZWJhY2sgY29ubmVjdG9yIG9yIGl0IGlzIG9ubHkga21zX3dyaXRlYmFjayB3aGlj
aCBpcyBzdXBwb3NlZCB0bwo+PiBiZSB0aGUgb25lLgo+Pgo+PiBMZXRzIHRyeSB3aXRoIHRoZSBs
YXR0ZXIgYXBwcm9hY2ggYnkgc2V0dGluZyBEUk1fQ0xJRU5UX0NBUF9XUklURUJBQ0tfQ09OTkVD
VE9SUwo+PiBvbmx5IHdpdGhpbiBrbXNfd3JpdGViYWNrLgo+Pgo+PiBjaGFuZ2VzIHNpbmNlIFJG
QzoKPj4gCS0gbWlub3IgZml4ZXMgdG8gY29tbWl0IG1lc3NhZ2UKPj4KPj4gY2hhbmdlcyBpbiB2
MjoKPj4gCS0gdXNlIGlndF9yZXF1aXJlX2YgdG8gcHJpbnQgZGVzY3JpcHRpdmUgbWVzc2FnZQo+
PiAJLSBhZGQgbXNtIGNhcmQgZmFpbHVyZSBkZXRhaWxzIGluIGNvbW1pdCB0ZXh0Cj4+Cj4+IFJl
dmlld2VkLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+Cj4+IEFja2VkLWJ5OiBE
bWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+Cj4+IEFja2VkLWJ5
OiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+Cj4+IEFj
a2VkLWJ5OiBQZXRyaSBMYXR2YWxhIDxhZHJpbmFlbEBhZHJpbmFlbC5uZXQ+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEFiaGluYXYgS3VtYXIgPHF1aWNfYWJoaW5hdmtAcXVpY2luYy5jb20+Cj4gCj4gVGhh
bmsgeW91IGZvciBjb250cmlidXRpb24sIEkgbWVyZ2VkIGl0LiBUaGVyZSBhcmUgc29tZSBmYWls
cwo+IGZvciBYZSBidXQgb24gaTkxNSBhbGwgcnVucyBvay4KPiBBZGRpbmcgdG8gY2MgZmV3IGtt
cyBkZXZzIGZyb20gSW50ZWwgLSBCaGFudSBhbmQgSi1QLgoKT24gaTkxNSBvciBYZSBub2JvZHkg
aGF2ZSBpbXBsZW1lbnRlZCB3cml0ZWJhY2sgY29ubmVjdG9yIHNvIHRob3NlIApyYW5kb20gY2kg
aXNzdWVzIGhhdmUgbm8gcmVsYXRpb24gdG8gdGhlc2UgY2hhbmdlcy4KCi9KdWhhLVBla2thCgo+
PiAtLS0KPj4gICBsaWIvaWd0X2ttcy5jICAgICAgICAgfCAyIC0tCj4+ICAgdGVzdHMva21zX3dy
aXRlYmFjay5jIHwgNSArKysrKwo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvbGliL2lndF9rbXMuYyBiL2xpYi9p
Z3Rfa21zLmMKPj4gaW5kZXggOThkM2ZiNzljZDIyLi5mODIxMDIxNDRlYTEgMTAwNjQ0Cj4+IC0t
LSBhL2xpYi9pZ3Rfa21zLmMKPj4gKysrIGIvbGliL2lndF9rbXMuYwo+PiBAQCAtMjg3OCw4ICsy
ODc4LDYgQEAgdm9pZCBpZ3RfZGlzcGxheV9yZXF1aXJlKGlndF9kaXNwbGF5X3QgKmRpc3BsYXks
IGludCBkcm1fZmQpCj4+ICAgCWlmIChkcm1TZXRDbGllbnRDYXAoZHJtX2ZkLCBEUk1fQ0xJRU5U
X0NBUF9BVE9NSUMsIDEpID09IDApCj4+ICAgCQlkaXNwbGF5LT5pc19hdG9taWMgPSAxOwo+PiAg
IAo+PiAtCWRybVNldENsaWVudENhcChkcm1fZmQsIERSTV9DTElFTlRfQ0FQX1dSSVRFQkFDS19D
T05ORUNUT1JTLCAxKTsKPj4gLQo+PiAgIAlyZXNvdXJjZXMgPSBkcm1Nb2RlR2V0UmVzb3VyY2Vz
KGRpc3BsYXktPmRybV9mZCk7Cj4+ICAgCWlmICghcmVzb3VyY2VzKQo+PiAgIAkJZ290byBvdXQ7
Cj4+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfd3JpdGViYWNrLmMgYi90ZXN0cy9rbXNfd3JpdGVi
YWNrLmMKPj4gaW5kZXggNmNkNjg1YjM3YWYyLi5mODliMmQ2MmZjYzkgMTAwNjQ0Cj4+IC0tLSBh
L3Rlc3RzL2ttc193cml0ZWJhY2suYwo+PiArKysgYi90ZXN0cy9rbXNfd3JpdGViYWNrLmMKPj4g
QEAgLTU1OCw2ICs1NTgsNyBAQCBpZ3RfbWFpbl9hcmdzKCJiOmM6ZjpkbCIsIGxvbmdfb3B0aW9u
cywgaGVscF9zdHIsIG9wdF9oYW5kbGVyLCBOVUxMKQo+PiAgIAlpZ3RfZmJfdCBpbnB1dF9mYiwg
aW5wdXRfZmJfMTBiaXQ7Cj4+ICAgCWRybU1vZGVNb2RlSW5mbyBtb2RlOwo+PiAgIAl1bnNpZ25l
ZCBpbnQgZmJfaWQ7Cj4+ICsJaW50IHJldDsKPj4gICAKPj4gICAJbWVtc2V0KCZkaXNwbGF5LCAw
LCBzaXplb2YoZGlzcGxheSkpOwo+PiAgIAo+PiBAQCAtNTcwLDYgKzU3MSwxMCBAQCBpZ3RfbWFp
bl9hcmdzKCJiOmM6ZjpkbCIsIGxvbmdfb3B0aW9ucywgaGVscF9zdHIsIG9wdF9oYW5kbGVyLCBO
VUxMKQo+PiAgIAo+PiAgIAkJaWd0X3JlcXVpcmUoZGlzcGxheS5pc19hdG9taWMpOwo+PiAgIAo+
PiArCQlyZXQgPSBkcm1TZXRDbGllbnRDYXAoZGlzcGxheS5kcm1fZmQsIERSTV9DTElFTlRfQ0FQ
X1dSSVRFQkFDS19DT05ORUNUT1JTLCAxKTsKPj4gKwo+PiArCQlpZ3RfcmVxdWlyZV9mKCFyZXQs
ICJlcnJvciBzZXR0aW5nIERSTV9DTElFTlRfQ0FQX1dSSVRFQkFDS19DT05ORUNUT1JTXG4iKTsK
Pj4gKwo+PiAgIAkJb3V0cHV0ID0ga21zX3dyaXRlYmFja19nZXRfb3V0cHV0KCZkaXNwbGF5KTsK
Pj4gICAJCWlndF9yZXF1aXJlKG91dHB1dCk7Cj4+ICAgCj4+Cj4+IC0tLQo+PiBiYXNlLWNvbW1p
dDogNGE1ZmQ0ZTdjYjI3OTg2MzZmNjQ2NGUyYmQ2MTM5OWYzMjQyYjMyMgo+PiBjaGFuZ2UtaWQ6
IDIwMjQwNTA5LXdiX2lndF9maXgtODcxNjk2NTFlMGRhCj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4g
LS0gCj4+IEFiaGluYXYgS3VtYXIgPHF1aWNfYWJoaW5hdmtAcXVpY2luYy5jb20+Cj4+Ci0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpJbnRlbCBGaW5sYW5kIE95ClJlZ2lzdGVyZWQgQWRkcmVzczogUEwgMjgxLCAwMDE4
MSBIZWxzaW5raSAKQnVzaW5lc3MgSWRlbnRpdHkgQ29kZTogMDM1NzYwNiAtIDQgCkRvbWljaWxl
ZCBpbiBIZWxzaW5raSAKClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRh
aW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVk
IHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGllbnQs
IHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgo=


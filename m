Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA739C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 14:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFB310E8E1;
	Thu, 13 Mar 2025 14:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XW4k1S02";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F11210E8D8
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 14:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741877343; x=1773413343;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=oMJE3c1IAF64nNXzlRnKzmNuOL2STn4XngahP2htCdU=;
 b=XW4k1S0275LbINRmT/sHLP++4sgRrFqsahQOb9lnitRd7OEjFq80Zy1v
 WCmQkbZtCFCa+LFcXGEsMmxgVh1Ujvg9UL+8OqwLfZ9EP0VAoFCEAUTBY
 K6qnSfBUNoYZ5dhMRYtmUN3xTW1RsGEC76gdd0M38zP91/2eRkaW/bIKb
 VYTpgDgsiqm9YQeYggB19m4bRcFlNmbP/3pqKR4oiE0owaT4zYMXzzA7n
 dnaGv2sG/44HVonLzIL8+h42RFRzpVLSP1YL3A1b2iH2y6c1dKCwpTZAg
 MS21336mITf0c0FYvRRVaeV2zVeR4rPsk9WQai0MrrU/+OPzeGlG7Kbd5 g==;
X-CSE-ConnectionGUID: vytoqkVYRl2o/02TGppOZQ==
X-CSE-MsgGUID: D+Se3qaFQdCKGQen/oIyxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="30589913"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="30589913"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:48:08 -0700
X-CSE-ConnectionGUID: OrIhChawT4epid3h/si6Sw==
X-CSE-MsgGUID: JnnyroqhSNe1wcZUNDUUFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="120930386"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.144])
 ([10.245.246.144])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:48:06 -0700
Message-ID: <4edd2330ffc8c9f800f2c8fdd234060ffe6d4623.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 09/11] lib/intel_compute: Fix enqueued local size
 in xehp
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, igt-dev@lists.freedesktop.org
Date: Thu, 13 Mar 2025 15:48:04 +0100
In-Reply-To: <20250311152321.16497-10-francois.dugast@intel.com>
References: <20250311152321.16497-1-francois.dugast@intel.com>
 <20250311152321.16497-10-francois.dugast@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

T24gVHVlLCAyMDI1LTAzLTExIGF0IDE2OjIxICswMTAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
Cj4gQWNjb3JkaW5nIHRvIHRoZSBtZXRhZGF0YSBvZiB0aGUgY29tcHV0ZSBrZXJuZWwgdXNlZCBm
b3IgdGhpcyB0ZXN0LAo+IHRoZQo+IGVucXVldWVkX2xvY2FsX3NpemUgY29tZXMgYXQgb2Zmc2V0
IDUyLCByaWdodCBhZnRlciB0aGUgdmFsdWUgb2YgdGhlCj4gImNvdW50IiBhcmd1bWVudC4gRml4
IGl0IGFuZCBhZGQgY29tbWVudHMgZm9yIGNsYXJpdHkuCj4gCj4gUmVsZXZhbnQgcGFydCBvZiB0
aGUga2VybmVsIG1ldGFkYXRhOgo+IAo+IMKgwqDCoMKgwqAgLSBhcmdfdHlwZTrCoMKgwqDCoMKg
wqDCoCBhcmdfYnlwb2ludGVyCj4gwqDCoMKgwqDCoMKgwqAgb2Zmc2V0OsKgwqDCoMKgwqDCoMKg
wqDCoCAzMgo+IMKgwqDCoMKgwqDCoMKgIHNpemU6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA4Cj4g
wqDCoMKgwqDCoMKgwqAgYXJnX2luZGV4OsKgwqDCoMKgwqDCoCAwCj4gwqDCoMKgwqDCoMKgwqAg
YWRkcm1vZGU6wqDCoMKgwqDCoMKgwqAgc3RhdGVsZXNzCj4gwqDCoMKgwqDCoMKgwqAgYWRkcnNw
YWNlOsKgwqDCoMKgwqDCoCBnbG9iYWwKPiDCoMKgwqDCoMKgwqDCoCBhY2Nlc3NfdHlwZTrCoMKg
wqDCoCByZWFkd3JpdGUKPiDCoMKgwqDCoMKgIC0gYXJnX3R5cGU6wqDCoMKgwqDCoMKgwqAgYXJn
X2J5cG9pbnRlcgo+IMKgwqDCoMKgwqDCoMKgIG9mZnNldDrCoMKgwqDCoMKgwqDCoMKgwqAgNDAK
PiDCoMKgwqDCoMKgwqDCoCBzaXplOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOAo+IMKgwqDCoMKg
wqDCoMKgIGFyZ19pbmRleDrCoMKgwqDCoMKgwqAgMQo+IMKgwqDCoMKgwqDCoMKgIGFkZHJtb2Rl
OsKgwqDCoMKgwqDCoMKgIHN0YXRlbGVzcwo+IMKgwqDCoMKgwqDCoMKgIGFkZHJzcGFjZTrCoMKg
wqDCoMKgwqAgZ2xvYmFsCj4gwqDCoMKgwqDCoMKgwqAgYWNjZXNzX3R5cGU6wqDCoMKgwqAgcmVh
ZHdyaXRlCj4gwqDCoMKgwqDCoCAtIGFyZ190eXBlOsKgwqDCoMKgwqDCoMKgIGFyZ19ieXZhbHVl
Cj4gwqDCoMKgwqDCoMKgwqAgb2Zmc2V0OsKgwqDCoMKgwqDCoMKgwqDCoCA0OAo+IMKgwqDCoMKg
wqDCoMKgIHNpemU6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA0Cj4gwqDCoMKgwqDCoMKgwqAgYXJn
X2luZGV4OsKgwqDCoMKgwqDCoCAyCj4gwqDCoMKgwqDCoCAtIGFyZ190eXBlOsKgwqDCoMKgwqDC
oMKgIGVucXVldWVkX2xvY2FsX3NpemUKPiDCoMKgwqDCoMKgwqDCoCBvZmZzZXQ6wqDCoMKgwqDC
oMKgwqDCoMKgIDUyCj4gwqDCoMKgwqDCoMKgwqAgc2l6ZTrCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IDEyCj4gCj4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3RA
aW50ZWwuY29tPgpSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ry
b21AbGludXguaW50ZWwuY29tPgoKPiAtLS0KPiDCoGxpYi9pbnRlbF9jb21wdXRlLmMgfCA2ICsr
Ky0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvbGliL2ludGVsX2NvbXB1dGUuYyBiL2xpYi9pbnRlbF9jb21wdXRl
LmMKPiBpbmRleCA3YTJlMDRiMTAuLmY1YjNhODhmMCAxMDA2NDQKPiAtLS0gYS9saWIvaW50ZWxf
Y29tcHV0ZS5jCj4gKysrIGIvbGliL2ludGVsX2NvbXB1dGUuYwo+IEBAIC03ODEsMTIgKzc4MSwx
MiBAQCBzdGF0aWMgdm9pZCB4ZWhwX2NyZWF0ZV9pbmRpcmVjdF9kYXRhKHVpbnQzMl90Cj4gKmFk
ZHJfYm9fYnVmZmVyX2JhdGNoLAo+IMKgCWFkZHJfYm9fYnVmZmVyX2JhdGNoW2IrK10gPSBhZGRy
X291dHB1dCAmIDB4ZmZmZmZmZmY7Cj4gwqAJYWRkcl9ib19idWZmZXJfYmF0Y2hbYisrXSA9IGFk
ZHJfb3V0cHV0ID4+IDMyOwo+IMKgCWFkZHJfYm9fYnVmZmVyX2JhdGNoW2IrK10gPSBsb29wX2Nv
dW50Owo+ICsJYWRkcl9ib19idWZmZXJfYmF0Y2hbYisrXSA9IDB4MDAwMDA0MDA7IC8vIEVucXVl
dWVkIGxvY2FsCj4gc2l6ZSBYCj4gKwlhZGRyX2JvX2J1ZmZlcl9iYXRjaFtiKytdID0gMHgwMDAw
MDAwMTsgLy8gRW5xdWV1ZWQgbG9jYWwKPiBzaXplIFkKPiArCWFkZHJfYm9fYnVmZmVyX2JhdGNo
W2IrK10gPSAweDAwMDAwMDAxOyAvLyBFbnF1ZXVlZCBsb2NhbAo+IHNpemUgWgo+IMKgCWFkZHJf
Ym9fYnVmZmVyX2JhdGNoW2IrK10gPSAweDAwMDAwMDAwOwo+IMKgCWFkZHJfYm9fYnVmZmVyX2Jh
dGNoW2IrK10gPSAweDAwMDAwMDAwOwo+IMKgCWFkZHJfYm9fYnVmZmVyX2JhdGNoW2IrK10gPSAw
eDAwMDAwMDAwOwo+IC0JYWRkcl9ib19idWZmZXJfYmF0Y2hbYisrXSA9IDB4MDAwMDA0MDA7Cj4g
LQlhZGRyX2JvX2J1ZmZlcl9iYXRjaFtiKytdID0gMHgwMDAwMDAwMTsKPiAtCWFkZHJfYm9fYnVm
ZmVyX2JhdGNoW2IrK10gPSAweDAwMDAwMDAxOwo+IMKgCWFkZHJfYm9fYnVmZmVyX2JhdGNoW2Ir
K10gPSAweDAwMDAwMDAwOwo+IMKgCWFkZHJfYm9fYnVmZmVyX2JhdGNoW2IrK10gPSAweDAwMDAw
MDAwOwo+IMKgCWFkZHJfYm9fYnVmZmVyX2JhdGNoW2IrK10gPSAweDAwMDAwMDAwOwoK


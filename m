Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30E089D5F
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Nov 2018 08:46:07 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id f23so18297002edb.3
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Nov 2018 00:46:07 -0800 (PST)
Date: Tue, 27 Nov 2018 09:46:03 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20181127084603.GW4266@phenom.ffwll.local>
References: <20181122093700.31211-1-daniel.vetter@ffwll.ch>
 <20181122093700.31211-3-daniel.vetter@ffwll.ch>
 <c42be249-59d9-ab7b-8e8d-5cc4aa3959d8@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c42be249-59d9-ab7b-8e8d-5cc4aa3959d8@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/5] lib/kms: Drop igt_display_init
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjYsIDIwMTggYXQgMDE6Mzc6MDNQTSAtMDgwMCwgQW50b25pbyBBcmdlbnpp
YW5vIHdyb3RlOgo+IAo+IAo+IE9uIDIyLzExLzE4IDAxOjM2LCBEYW5pZWwgVmV0dGVyIHdyb3Rl
Ogo+ID4gSWYgeW91IG5lZWQgdGhlIGhpZ2gtbGV2ZWwgZnVuY3Rpb25zLCB0aGVuIHlvdSBwcm9i
YWJseSBuZWVkIGEKPiA+IGZ1bGwgZGlzcGxheS4gVW5leHBvcnQgdGhlIG5vbi1yZXF1aXJpbmcg
dmVyc2lvbiwgYW5kIGFkanVzdCB0aGUKPiA+IGRvY3VtZW50YXRpb24uIFRoaXMgYWxzbyBnaXZl
cyB1cyBwcm9wZXIgZG9jcyBmb3IgdGhlIHJlY2VudGx5Cj4gPiBhZGRlZCBpZ3RfZGlzcGxheV9y
ZXF1aXJlLgo+IAo+IEkgYWN0dWFsbHkgbGlrZWQgaGF2aW5nIGluaXQgYW5kIHJlcXVpcmUgdG8g
YmUgc2VwYXJhdGUuIEFyZSB0aGVyZSBubwo+IG5lZ2F0aXZlIHRlc3QgY2FzZXMgdGhhdCBtaWdo
dCBwbGF5LWFyb3VuZCB3aXRoIGEgZmFpbGluZyBpbml0PwoKV2UgZG9udCAoeWV0PykgaGF2ZSB0
ZXN0Y2FzZXMgZm9yIHRoZSBpZ3RfZGlzcGxheSBsaWJyYXJ5IGl0c2VsZi4gRm9yIGFueQprZXJu
ZWwgdGVzdHMgdGhlIHN1bW1hciBhYm92ZSBleHBsYWlucyBpdDogSWYgeW91IHdhbnQgdG8gd3Jp
dGUKbG93LWxldmVsL25lZ2F0aXZlIHRlc3RzIG9mIGF0b21pYy9rbXMgZnVuY3Rpb25hbGl0eSwg
aWd0X2Rpc3BsYXkgaXMgdG8KaGlnaC1sZXZlbCB0byBiZSB1c2VmdWwuIEFsbCB0aG9zZSB0ZXN0
cyB1c2UgbGliZHJtIGZ1bmN0aW9ucyBkaXJlY3RseQoocGx1cyBtYXliZSBzb21lIG9mIHRoZSBs
b3ctbGV2ZWwgaGVscGVycyB3ZSBoYXZlLCB0aGUgZnVuY3Rpb25zIHdpdGgKa21zdGVzdF8gcHJl
Zml4ZXMpLgoKPiBvdGhlciB0aGFuIHRoYXQgdGhlIHNlcmllcyBMR1RNIGJ1dCB5b3UgbWlnaHQg
d2FudCBzb21lb25lIHRvIGxvb2sgYXQgWzIvNV0KPiBpbiBkZXRhaWxzLAo+IEFja2VkLUJ5OiBB
bnRvbmlvIEFyZ2Vuemlhbm8KClRoYW5rcyBmb3IgdGFraW5nIGEgbG9vaywgSSdsbCBwdWxsIGlu
IHRoZSBlbnRpcmUgc2VyaWVzIG5vdy4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

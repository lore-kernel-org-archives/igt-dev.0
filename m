Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BBF6E7FA
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2018 11:32:07 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180125112150.GB5453@intel.com>
References: <20180125010003.7678-1-antonio.argenziano@intel.com>
 <20180125112150.GB5453@intel.com>
Message-ID: <151687992294.674.3452009084960122423@mail.alporthouse.com>
Date: Thu, 25 Jan 2018 11:32:02 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/3] lib/igt_aux: Add function to
 swap int64 in array
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
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Antonio Argenziano <antonio.argenziano@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqw6Rsw6QgKDIwMTgtMDEtMjUgMTE6MjE6NTApCj4gT24gV2VkLCBK
YW4gMjQsIDIwMTggYXQgMDU6MDA6MDFQTSAtMDgwMCwgQW50b25pbyBBcmdlbnppYW5vIHdyb3Rl
Ogo+ID4gU2lnbmVkLW9mZi1ieTogQW50b25pbyBBcmdlbnppYW5vIDxhbnRvbmlvLmFyZ2Vuemlh
bm9AaW50ZWwuY29tPgo+ID4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNv
LnVrPgo+ID4gQ2M6IE1pY2hhbCBXaW5pYXJza2kgPG1pY2hhbC53aW5pYXJza2lAaW50ZWwuY29t
Pgo+ID4gLS0tCj4gPiAgbGliL2lndF9hdXguYyB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiA+
ICBsaWIvaWd0X2F1eC5oIHwgIDEgKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9u
cygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9hdXguYyBiL2xpYi9pZ3RfYXV4LmMK
PiA+IGluZGV4IDhjYTBiNjBkLi44MDEyZDhhZSAxMDA2NDQKPiA+IC0tLSBhL2xpYi9pZ3RfYXV4
LmMKPiA+ICsrKyBiL2xpYi9pZ3RfYXV4LmMKPiA+IEBAIC01NzcsNiArNTc3LDI1IEBAIHZvaWQg
aWd0X2V4Y2hhbmdlX2ludCh2b2lkICphcnJheSwgdW5zaWduZWQgaSwgdW5zaWduZWQgaikKPiA+
ICAgICAgIGludF9hcnJbal0gPSB0bXA7Cj4gPiAgfQo+ID4gIAo+ID4gKy8qKgo+ID4gKyAqIGln
dF9leGNoYW5nZV9pbnQ2NDoKPiA+ICsgKiBAYXJyYXk6IHBvaW50ZXIgdG8gdGhlIGFycmF5IG9m
IGludDY0X3QKPiA+ICsgKiBAaTogZmlyc3QgcG9zaXRpb24KPiA+ICsgKiBAajogc2Vjb25kIHBv
c2l0aW9uCj4gPiArICoKPiA+ICsgKiBFeGNoYW5nZXMgdGhlIHR3byB2YWx1ZXMgYXQgYXJyYXkg
aW5kaWNlcyBAaSBhbmQgQGouIFVzZWZ1bCBhcyBhbiBleGNoYW5nZQo+ID4gKyAqIGZ1bmN0aW9u
IGZvciBpZ3RfcGVybXV0ZV9hcnJheSgpLgo+ID4gKyAqLwo+ID4gK3ZvaWQgaWd0X2V4Y2hhbmdl
X2ludDY0KHZvaWQgKmFycmF5LCB1bnNpZ25lZCBpLCB1bnNpZ25lZCBqKQo+ID4gK3sKPiA+ICsg
ICAgIGludDY0X3QgKmludF9hcnIsIHRtcDsKPiAKPiBXaHkgdm9pZCogd2hlbiB5b3UgcmVhbGx5
IG1lYW4gaW50NjRfdCo/CgpUbyBmaXQgdGhlIGZ1bmN0aW9uIHByb3RvdHlwZSBmb3IgaWd0X3Bl
cm11dGVfYXJyYXkoKS4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=

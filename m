Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F346E087
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Nov 2018 12:18:06 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id h50so4707330ede.5
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Nov 2018 04:18:06 -0800 (PST)
Date: Wed, 21 Nov 2018 13:18:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20181121121801.GT4266@phenom.ffwll.local>
References: <20181031133223.30993-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181031133223.30993-1-daniel.vetter@ffwll.ch>
Subject: Re: [igt-dev] [PATCH i-g-t] gitlab-ci: Depend docker images jobs on
 .gitlab-ci.yaml too
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBPY3QgMzEsIDIwMTggYXQgMDI6MzI6MjNQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPdGhlcndpc2UgaXQncyByZWFsbHkgaGFyZCB0byBnZXQgdGhlc2Ugam9icyB0byBy
dW4gd2hlbiB5b3UgbmVlZCB0aGVtCj4gdG9vIGJlY2F1c2UgeW91IGNoYW5nZWQgc29tZXRoaW5n
IHdpdGggdGhlIGJ1aWxkIGluc3RydWN0aW9ucy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KClB1c2hlZCB3aXRoIEFyZWsncyBpcmMg
YWNrLgotRGFuaWVsCgo+IC0tLQo+ICAuZ2l0bGFiLWNpLnltbCB8IDMgKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvLmdpdGxhYi1jaS55bWwg
Yi8uZ2l0bGFiLWNpLnltbAo+IGluZGV4IDJjMTdlYzYxMzEyOC4uYjQxZGYzN2U2ZDdjIDEwMDY0
NAo+IC0tLSBhLy5naXRsYWItY2kueW1sCj4gKysrIGIvLmdpdGxhYi1jaS55bWwKPiBAQCAtMTI0
LDYgKzEyNCw3IEBAIGNvbnRhaW5lcnM6aWd0LWRlYmlhbjoKPiAgICBvbmx5Ogo+ICAgICAgY2hh
bmdlczoKPiAgICAgICAgLSBEb2NrZXJmaWxlLmRlYmlhbgo+ICsgICAgICAtIC5naXRsYWItY2ku
eW1sCj4gICAgc2VydmljZXM6Cj4gICAgICAtIGRvY2tlcjpkaW5kCj4gICAgdmFyaWFibGVzOgo+
IEBAIC0xNDAsNiArMTQxLDcgQEAgY29udGFpbmVyczppZ3QtZGViaWFuLWFybTY0Ogo+ICAgIG9u
bHk6Cj4gICAgICBjaGFuZ2VzOgo+ICAgICAgICAtIERvY2tlcmZpbGUuZGViaWFuLWFybTY0Cj4g
KyAgICAgIC0gLmdpdGxhYi1jaS55bWwKPiAgICBzZXJ2aWNlczoKPiAgICAgIC0gZG9ja2VyOmRp
bmQKPiAgICB2YXJpYWJsZXM6Cj4gQEAgLTE1Niw2ICsxNTgsNyBAQCBjb250YWluZXJzOmlndC1m
ZWRvcmE6Cj4gICAgb25seToKPiAgICAgIGNoYW5nZXM6Cj4gICAgICAgIC0gRG9ja2VyZmlsZS5m
ZWRvcmEKPiArICAgICAgLSAuZ2l0bGFiLWNpLnltbAo+ICAgIHNlcnZpY2VzOgo+ICAgICAgLSBk
b2NrZXI6ZGluZAo+ICAgIHZhcmlhYmxlczoKPiAtLSAKPiAyLjE5LjEKPiAKCi0tIApEYW5pZWwg
VmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5m
ZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK

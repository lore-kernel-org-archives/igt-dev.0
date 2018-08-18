Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl0-x244.google.com (mail-pl0-x244.google.com
 [IPv6:2607:f8b0:400e:c01::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A976E041
 for <igt-dev@lists.freedesktop.org>; Sat, 18 Aug 2018 00:04:56 +0000 (UTC)
Received: by mail-pl0-x244.google.com with SMTP id e11-v6so4398366plb.3
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Aug 2018 17:04:56 -0700 (PDT)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@gmail.com>
Date: Fri, 17 Aug 2018 17:04:52 -0700
Message-ID: <5623183.8tgAT2qijB@dk>
In-Reply-To: <20180817085642.19501-4-maarten.lankhorst@linux.intel.com>
References: <20180817085642.19501-1-maarten.lankhorst@linux.intel.com>
 <20180817085642.19501-4-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v5 4/4] tests/kms_frontbuffer_tracking:
 Don't unset mode after reading CRC
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpZGF5LCBBdWd1c3QgMTcsIDIwMTggMTo1Njo0MiBBTSBQRFQgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gVW50aWwgdGhlIHByZXZpb3VzIGNvbW1pdCB3ZSBoYWQgdG8gZGlzYWJsZSB0
aGUgbW9kZSBhZnRlciByZWFkaW5nIENSQwo+IGJlY2F1c2Ugb3RoZXJ3aXNlIHdlIG1pZ2h0IG5v
dCBoYXZlIGJlZW4gZW5hYmxlIGZlYXR1cmVzIGNvcnJlY3RseS4KPiAKSSBkaWRuJ3QgZ2V0IHRo
aXMsIHdoeSB3YXMgdGhpcyB0aGUgY2FzZT8KCi1ESwoKPiBOb3cgd2UgY2FuIGp1c3Qgc3RhZ2Ug
dGhlIGRpc2FibGUgd2l0aG91dCBhcHBseWluZyBpdCwgc28gZWFjaCBzdWJ0ZXN0Cj4gY2FuIHNl
dCBpdHMgZGVzaXJlZCBtb2RlIGFuZCBpZ3RfZGlzcGxheSB3aWxsIHVwZGF0ZSB0aGUgc3RhdGUg
YXMKPiByZXF1aXJlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICB0ZXN0cy9rbXNfZnJvbnRi
dWZmZXJfdHJhY2tpbmcuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZnJvbnRidWZm
ZXJfdHJhY2tpbmcuYwo+IGIvdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMgaW5kZXgg
YTU3MGY5M2EzM2E4Li45MjFhYWZmY2I1MmMgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMva21zX2Zyb250
YnVmZmVyX3RyYWNraW5nLmMKPiArKysgYi90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcu
Ywo+IEBAIC0xMjIwLDcgKzEyMjAsNyBAQCBzdGF0aWMgdm9pZCBpbml0X2JsdWVfY3JjKGVudW0g
cGl4ZWxfZm9ybWF0IGZvcm1hdCkKPiAKPiAgCXByaW50X2NyYygiQmx1ZSBDUkM6ICAiLCAmYmx1
ZV9jcmNzW2Zvcm1hdF0uY3JjKTsKPiAKPiAtCXVuc2V0X2FsbF9jcnRjcygpOwo+ICsJaWd0X2Rp
c3BsYXlfcmVzZXQoJmRybS5kaXNwbGF5KTsKPiAKPiAgCWlndF9yZW1vdmVfZmIoZHJtLmZkLCAm
Ymx1ZSk7Cj4gCj4gQEAgLTEyNzIsNyArMTI3Miw3IEBAIHN0YXRpYyB2b2lkIGluaXRfY3Jjcyhl
bnVtIHBpeGVsX2Zvcm1hdCBmb3JtYXQsCj4gIAkJcHJpbnRfY3JjKCIiLCAmcGF0dGVybi0+Y3Jj
c1tmb3JtYXRdW3JdKTsKPiAgCX0KPiAKPiAtCXVuc2V0X2FsbF9jcnRjcygpOwo+ICsJaWd0X2Rp
c3BsYXlfcmVzZXQoJmRybS5kaXNwbGF5KTsKPiAKPiAgCWZvciAociA9IDA7IHIgPCBwYXR0ZXJu
LT5uX3JlY3RzOyByKyspCj4gIAkJaWd0X3JlbW92ZV9mYihkcm0uZmQsICZ0bXBfZmJzW3JdKTsK
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=

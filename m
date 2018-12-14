Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77AB6E23E
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Dec 2018 19:42:31 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id i7so7474403qtj.10
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Dec 2018 11:42:31 -0800 (PST)
Message-ID: <ae9bf29d27e05988e04ef27211f69532fca13aec.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Fri, 14 Dec 2018 14:42:29 -0500
In-Reply-To: <20181213155533.18048-4-paul.kocialkowski@bootlin.com>
References: <20181213155533.18048-1-paul.kocialkowski@bootlin.com>
 <20181213155533.18048-4-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 03/12] chamelium: Debug-print CRCs
 when comparing them and dumping frames
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
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, Boris Brezillon <boris.brezillon@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlLVBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBUaHUsIDIwMTgt
MTItMTMgYXQgMTY6NTUgKzAxMDAsIFBhdWwgS29jaWFsa293c2tpIHdyb3RlOgo+IEFkZCBkZWJ1
ZyBwcmludHMgZm9yIHRoZSByZWZlcmVuY2UgYW5kIGNhcHR1cmVkIENSQ3Mgd2hlbiBjb21wYXJp
bmcgdGhlbQo+IGFuZCBkdW1waW5nIHRoZW0sIHdoaWNoIGNhbiBiZSB1c2VmdWwgdG8gZ2V0IGFu
IGlkZWEgb2Ygd2hhdCBpcyBnb2luZyBvbgo+IChlLmcuIHNwZWNpZmljIG5vaXNlIG9uIGRpc3Bs
YXkgY2FibGVzIG9mdGVuIG9ubHkgY2hhbmdlcyBvbmUgb2YgdGhlCj4gdmFsdWVzIHRoYXQgY29t
cG9zZSB0aGUgQ1JDKS4KPiAKPiBJdCdzIGFsc28gdXNlZnVsIHRvIGFzc29jaWF0ZSBhIHRlc3Qg
ZGVidWcgb3V0cHV0IHdpdGggdGhlIGR1bXBlZAo+IHBpY3R1cmVzICh0aGF0IGhhdmUgdGhlIENS
QyBpbiB0aGVpciBuYW1lKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIEtvY2lhbGtvd3NraSA8
cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIGxpYi9pZ3RfY2hhbWVsaXVt
LmMgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9saWIvaWd0X2NoYW1lbGl1bS5jIGIvbGliL2lndF9jaGFtZWxpdW0uYwo+IGlu
ZGV4IGQxMzZmYjA0YzM0Mi4uMzJiODU5ZWFjNGE3IDEwMDY0NAo+IC0tLSBhL2xpYi9pZ3RfY2hh
bWVsaXVtLmMKPiArKysgYi9saWIvaWd0X2NoYW1lbGl1bS5jCj4gQEAgLTEwMzMsNiArMTAzMyw5
IEBAIHZvaWQgY2hhbWVsaXVtX2Fzc2VydF9jcmNfZXFfb3JfZHVtcChzdHJ1Y3QgY2hhbWVsaXVt
Cj4gKmNoYW1lbGl1bSwKPiAgCWNoYXIgKmNhcHR1cmVfc3VmZml4Owo+ICAJYm9vbCBlcTsKPiAg
Cj4gKwlpZ3RfZGVidWcoIlJlZmVyZW5jZSBDUkM6ICVzXG4iLCBpZ3RfY3JjX3RvX3N0cmluZyhy
ZWZlcmVuY2VfY3JjKSk7Cj4gKwlpZ3RfZGVidWcoIkNhcHR1cmVkIENSQzogJXNcbiIsIGlndF9j
cmNfdG9fc3RyaW5nKGNhcHR1cmVfY3JjKSk7Cj4gKwo+ICAJZXEgPSBpZ3RfY2hlY2tfY3JjX2Vx
dWFsKHJlZmVyZW5jZV9jcmMsIGNhcHR1cmVfY3JjKTsKPiAgCWlmICghZXEgJiYgaWd0X2ZyYW1l
X2R1bXBfaXNfZW5hYmxlZCgpKSB7Cj4gIAkJLyogR3JhYiB0aGUgcmVmZXJlbmNlIGZyYW1lIGZy
b20gZnJhbWVidWZmZXIgKi8KPiBAQCAtMTEwMSw2ICsxMTA0LDEwIEBAIHZvaWQKPiBjaGFtZWxp
dW1fYXNzZXJ0X2FuYWxvZ19mcmFtZV9tYXRjaF9vcl9kdW1wKHN0cnVjdCBjaGFtZWxpdW0gKmNo
YW1lbGl1bSwKPiAgCQljYXB0dXJlX2NyYyA9IGNoYW1lbGl1bV9nZXRfY3JjX2Zvcl9hcmVhKGNo
YW1lbGl1bSwgcG9ydCwgMCwKPiAwLAo+ICAJCQkJCQkJIDAsIDApOwo+ICAKPiArCQlpZ3RfZGVi
dWcoIlJlZmVyZW5jZSBDUkM6ICVzXG4iLAo+ICsJCQkgIGlndF9jcmNfdG9fc3RyaW5nKHJlZmVy
ZW5jZV9jcmMpKTsKPiArCQlpZ3RfZGVidWcoIkNhcHR1cmVkIENSQzogJXNcbiIsCj4gaWd0X2Ny
Y190b19zdHJpbmcoY2FwdHVyZV9jcmMpKTsKPiArCj4gIAkJcmVmZXJlbmNlX3N1ZmZpeCA9IGln
dF9jcmNfdG9fc3RyaW5nX2V4dGVuZGVkKHJlZmVyZW5jZV9jcmMsCj4gIAkJCQkJCQkgICAgICAn
LScsIDIpOwo+ICAJCWNhcHR1cmVfc3VmZml4ID0gaWd0X2NyY190b19zdHJpbmdfZXh0ZW5kZWQo
Y2FwdHVyZV9jcmMsICctJywKLS0gCkNoZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=

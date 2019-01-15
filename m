Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFB089FBC
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jan 2019 22:15:00 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id k12so4883454qtf.7
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jan 2019 14:15:00 -0800 (PST)
Message-ID: <4be1c5cbd9bf1816de5211c595cf8fb9be8d815c.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Tue, 15 Jan 2019 17:14:58 -0500
In-Reply-To: <20190111090532.19235-20-paul.kocialkowski@bootlin.com>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
 <20190111090532.19235-20-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 19/21] lib/igt_chamelium: Hook-in
 checkerboard comparison method in helpers
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
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBGcmksIDIwMTkt
MDEtMTEgYXQgMTA6MDUgKzAxMDAsIFBhdWwgS29jaWFsa293c2tpIHdyb3RlOgo+IFRoaXMgaW50
cm9kdWNlcyB0aGUgY2hlY2tlcmJvYXJkIGNoYW1lbGl1bSBjaGVja2luZyB0eXBlIGFuZCBob29r
cyB0aGUKPiBjYWxsIHRvIHRoZSBhc3NvY2lhdGVkIGlndF9mcmFtZSBtYXRjaGluZyBoZWxwZXIg
aW4gdGhlIGZyYW1lIG1hdGNoCj4gY2hhbWVsaXVtIGhlbHBlci4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBQYXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+Cj4gLS0t
Cj4gIGxpYi9pZ3RfY2hhbWVsaXVtLmMgfCA0ICsrKy0KPiAgbGliL2lndF9jaGFtZWxpdW0uaCB8
IDEgKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2NoYW1lbGl1bS5jIGIvbGliL2lndF9jaGFtZWxpdW0u
Ywo+IGluZGV4IDE3MzIxYTJjZWY4OS4uNzMxMjU5ZjJmMTk2IDEwMDY0NAo+IC0tLSBhL2xpYi9p
Z3RfY2hhbWVsaXVtLmMKPiArKysgYi9saWIvaWd0X2NoYW1lbGl1bS5jCj4gQEAgLTExMjcsNiAr
MTEyNyw5IEBAIHZvaWQgY2hhbWVsaXVtX2Fzc2VydF9mcmFtZV9tYXRjaF9vcl9kdW1wKHN0cnVj
dAo+IGNoYW1lbGl1bSAqY2hhbWVsaXVtLAo+ICAJY2FzZSBDSEFNRUxJVU1fQ0hFQ0tfQU5BTE9H
Ogo+ICAJCW1hdGNoID0gaWd0X2NoZWNrX2FuYWxvZ19mcmFtZV9tYXRjaChyZWZlcmVuY2UsIGNh
cHR1cmUpOwo+ICAJCWJyZWFrOwo+ICsJY2FzZSBDSEFNRUxJVU1fQ0hFQ0tfQ0hFQ0tFUkJPQVJE
Ogo+ICsJCW1hdGNoID0gaWd0X2NoZWNrX2NoZWNrZXJib2FyZF9mcmFtZV9tYXRjaChyZWZlcmVu
Y2UsCj4gY2FwdHVyZSk7Cj4gKwkJYnJlYWs7Cj4gIAlkZWZhdWx0Ogo+ICAJCWlndF9hc3NlcnQo
ZmFsc2UpOwo+ICAJfQo+IEBAIC0xMTU1LDcgKzExNTgsNiBAQCB2b2lkIGNoYW1lbGl1bV9hc3Nl
cnRfZnJhbWVfbWF0Y2hfb3JfZHVtcChzdHJ1Y3QKPiBjaGFtZWxpdW0gKmNoYW1lbGl1bSwKPiAg
CWNhaXJvX3N1cmZhY2VfZGVzdHJveShjYXB0dXJlKTsKPiAgfQo+ICAKPiAtCj4gIC8qKgo+ICAg
KiBjaGFtZWxpdW1fYW5hbG9nX2ZyYW1lX2Nyb3A6Cj4gICAqIEBjaGFtZWxpdW06IFRoZSBDaGFt
ZWxpdW0gaW5zdGFuY2UgdG8gdXNlCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfY2hhbWVsaXVtLmgg
Yi9saWIvaWd0X2NoYW1lbGl1bS5oCj4gaW5kZXggMDQyYWMwMTljY2RiLi5kNjE1OTMwN2YyNDAg
MTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9jaGFtZWxpdW0uaAo+ICsrKyBiL2xpYi9pZ3RfY2hhbWVs
aXVtLmgKPiBAQCAtNDIsNiArNDIsNyBAQCBzdHJ1Y3QgY2hhbWVsaXVtX2ZiX2NyY19hc3luY19k
YXRhOwo+ICAKPiAgZW51bSBjaGFtZWxpdW1fY2hlY2sgewo+ICAJQ0hBTUVMSVVNX0NIRUNLX0FO
QUxPRywKPiArCUNIQU1FTElVTV9DSEVDS19DSEVDS0VSQk9BUkQsCj4gIAlDSEFNRUxJVU1fQ0hF
Q0tfQ1JDLAo+ICB9Owo+ICAKLS0gCkNoZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=

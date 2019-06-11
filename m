Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03163890B3
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2019 19:05:34 +0000 (UTC)
Date: Tue, 11 Jun 2019 12:07:33 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
Message-ID: <20190611190732.GA1616@intel.com>
References: <20190610232617.5094-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190610232617.5094-1-anusha.srivatsa@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_dp_dsc: Read the debugfs
 only once
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
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgMDQ6MjY6MTZQTSAtMDcwMCwgQW51c2hhIFNyaXZhdHNh
IHdyb3RlOgo+IEluc3RlYWQgb2YgZG9pbmcgYSBkZWJ1Z2ZzX3NpbXBsZV9yZWFkIGFuZCB0aGVu
Cj4gYSBkZWJ1Z2ZzX3JlYWQoKSwgbGV0cyByZWFkIHRoZSBkZWJ1Z2ZzIG5vZGUganVzdCBvbmNl
Lgo+IFdlIGFueXdheSBnZXQgdGhlIHN1aXRhYmxlIHJldHVybiBmcm9tIHRoZSBmb2xsb3dpbmcK
PiBzdHJzdHIgb3BlcmF0aW9uLgo+IAo+IEZvciBhbnkgZm9sbG93aW5nIHN1YnRlc3RzLCB3ZSB3
aWxsIGJlIHJlYWRpbmcgb25seSB0aGUKPiBjb250ZW50cyBvZiB0aGUgYnVmZmVyLiBXZSBjYW4g
YXZvaWQgdGhlIHNpbXBsZV9yZWFkCj4gYWx0b2dldGhlci4KPiAKPiBDYzogTWFuYXNpIE5hdmFy
ZSA8bWFuYXNpLmQubmF2YXJlQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbnVzaGEgU3Jp
dmF0c2EgPGFudXNoYS5zcml2YXRzYUBpbnRlbC5jb20+CgpNYWtlcyBzZW5zZSBhbmQgbG9va3Mg
Z29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBNYW5hc2kgTmF2YXJlIDw8bWFuYXNpLmQubmF2YXJl
QGludGVsLmNvbT4KCk1hbmFzaQoKPiAtLS0KPiAgdGVzdHMva21zX2RwX2RzYy5jIHwgMiAtLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
a21zX2RwX2RzYy5jIGIvdGVzdHMva21zX2RwX2RzYy5jCj4gaW5kZXggZTJlM2FhYTAuLjdmMmJm
Mjc2IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2ttc19kcF9kc2MuYwo+ICsrKyBiL3Rlc3RzL2ttc19k
cF9kc2MuYwo+IEBAIC04MCw4ICs4MCw2IEBAIHN0YXRpYyBib29sIGlzX2RwX2RzY19zdXBwb3J0
ZWQoZGF0YV90ICpkYXRhKQo+ICAKPiAgCXN0cmNweShmaWxlX25hbWUsIGRhdGEtPmNvbm5fbmFt
ZSk7Cj4gIAlzdHJjYXQoZmlsZV9uYW1lLCAiL2k5MTVfZHNjX2ZlY19zdXBwb3J0Iik7Cj4gLQlp
Z3RfcmVxdWlyZShpZ3RfZGVidWdmc19zaW1wbGVfcmVhZChkYXRhLT5kZWJ1Z2ZzX2ZkLCBmaWxl
X25hbWUsIGJ1ZiwKPiAtCQkJCQkgICAgc2l6ZW9mKGJ1ZikpID4gMCk7Cj4gIAlpZ3RfZGVidWdm
c19yZWFkKGRhdGEtPmRybV9mZCwgZmlsZV9uYW1lLCBidWYpOwo+ICAKPiAgCXJldHVybiBzdHJz
dHIoYnVmLCAiRFNDX1NpbmtfU3VwcG9ydDogeWVzIik7Cj4gLS0gCj4gMi4xNy4xCj4gCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==

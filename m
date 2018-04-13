Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016096EAEA
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Apr 2018 11:21:34 +0000 (UTC)
Date: Fri, 13 Apr 2018 13:21:32 +0200
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20180413112132.GH13079@kdec5-desk.ger.corp.intel.com>
References: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
 <20180411023732.32362-11-dhinakaran.pandiyan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180411023732.32362-11-dhinakaran.pandiyan@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 11/20] tests/psr: Check for drrs status
 only after checking for PSR
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
To: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBBcHIgMTAsIDIwMTggYXQgMDc6Mzc6MjNQTSAtMDcwMCwgRGhpbmFrYXJhbiBQYW5k
aXlhbiB3cm90ZToKPiBUaGUgZ29hbCBvZiB0aGlzIHRlc3QgaXMgKG9yIHNob3VsZCBiZSkgdG8g
dmVyaWZ5IERSUlMgaXMgZGlzYWJsZWQgaWYgUFNSCj4gd2FzIGVuYWJsZWQuIFRoZXJlIGlzIG5v
IHBvaW50IGluIGNoZWNraW5nIGZvciBEUlJTIHN0YXR1cyBpZiBQU1Igd2FzIG5vdAo+IGVuYWJs
ZWQgaW4gdGhlIGZpcnN0IHBsYWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERoaW5ha2FyYW4gUGFu
ZGl5YW4gPGRoaW5ha2FyYW4ucGFuZGl5YW5AaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogS2F0YXJ6
eW5hIERlYyA8a2F0YXJ6eW5hLmRlY0BpbnRlbC5jb20+Cj4gLS0tCj4gIHRlc3RzL2ttc19wc3Jf
c2lua19jcmMuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBk
aWZmIC0tZ2l0IGEvdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jIGIvdGVzdHMva21zX3Bzcl9zaW5r
X2NyYy5jCj4gaW5kZXggMTc0OTA3MjYuLmE3YzZhMDU3IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2tt
c19wc3Jfc2lua19jcmMuYwo+ICsrKyBiL3Rlc3RzL2ttc19wc3Jfc2lua19jcmMuYwo+IEBAIC00
ODYsNiArNDg2LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKPiAgCj4gIAlp
Z3Rfc3VidGVzdCgibm9fZHJycyIpIHsKPiAgCQlzZXR1cF90ZXN0X3BsYW5lKCZkYXRhKTsKPiAr
CQlpZ3RfYXNzZXJ0KHdhaXRfcHNyX2VudHJ5KCZkYXRhKSk7Cj4gIAkJaWd0X2Fzc2VydChkcnJz
X2Rpc2FibGVkKCZkYXRhKSk7Cj4gIAkJdGVzdF9jbGVhbnVwKCZkYXRhKTsKPiAgCX0KPiAtLSAK
PiAyLjE0LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

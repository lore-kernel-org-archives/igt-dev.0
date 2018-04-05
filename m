Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD6C6E8F1
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Apr 2018 23:12:30 +0000 (UTC)
Message-ID: <1522971406.2418.52.camel@dk-H97M-D3H>
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Thu, 05 Apr 2018 16:36:46 -0700
In-Reply-To: <20180405105844.21801-1-marta.lofstedt@intel.com>
References: <20180405105844.21801-1-marta.lofstedt@intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_psr_sink_crc: Save runtime by
 not waiting in crc function
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: dhinakaran.pandiyan@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Marta Lofstedt <marta.lofstedt@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgoKT24gVGh1LCAyMDE4LTA0LTA1IGF0IDEzOjU4ICswMzAwLCBNYXJ0YSBMb2ZzdGVkdCB3cm90
ZToKPiBUaGUgZ2V0X3NpbmtfY3JjIGZ1bmN0aW9uIHVzbGVlcCgzMDAwMDApIHdpdGggbW90aXZh
dGlvbjoKPiAiTm93IGdpdmUgYSB0aW1lIGZvciBodW1hbiBleWVzIi4gSG93ZXZlciwgdGhlIGZ1
bmN0aW9uIGhhcyBhbHJlYWR5Cj4gZXhpdGVkIGVhcmx5IG9uIGlndF9pbnRlcmFjdGl2ZV9kZWJ1
Zywgc28gbm8gaHVtYW4gaXMgd2FpdGluZy4KPiBBbHNvLCB3YWl0aW5nIGZvciBrZXlwcmVzcyBp
cyBvYnNvbGV0ZSB3aGVuIG5vdCBpbgo+IGlndF9pbnRlcmFjdGl2ZV9kZWJ1ZyBtb2RlLgo+IAoK
UmV2aWV3ZWQtYnk6IERoaW5ha2FyYW4gUGFuZGl5YW4gPGRoaW5ha2FyYW4ucGFuZGl5YW5AaW50
ZWwuY29tPgoKPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0YSBMb2ZzdGVkdCA8bWFydGEubG9mc3RlZHRA
aW50ZWwuY29tPgo+IC0tLQo+ICB0ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMgfCA2IC0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
a21zX3Bzcl9zaW5rX2NyYy5jIGIvdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jCj4gaW5kZXggMmI2
MGFjZjMuLjk4ZDI5YmE5IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2ttc19wc3Jfc2lua19jcmMuYwo+
ICsrKyBiL3Rlc3RzL2ttc19wc3Jfc2lua19jcmMuYwo+IEBAIC0yMzYsMTIgKzIzNiw2IEBAIHN0
YXRpYyB2b2lkIGdldF9zaW5rX2NyYyhkYXRhX3QgKmRhdGEsIGNoYXIgKmNyYykgewo+ICAJY2xv
c2UoZGlyKTsKPiAgCj4gIAlpZ3RfZGVidWcoIiVzXG4iLCBjcmMpOwo+IC0JaWd0X2RlYnVnX3dh
aXRfZm9yX2tleXByZXNzKCJjcmMiKTsKPiAtCj4gLQkvKiBUaGUgaW1wb3J0YW50IHZhbHVlIHdh
cyBhbHJlYWR5IHRha2VuLgo+IC0JICogTm93IGdpdmUgYSB0aW1lIGZvciBodW1hbiBleWVzCj4g
LQkgKi8KPiAtCXVzbGVlcCgzMDAwMDApOwo+ICAKPiAgCS8qIEJsYWNrIHNjcmVlbiBpcyBhbHdh
eXMgaW52YWxpZCAqLwo+ICAJaWd0X2Fzc2VydChzdHJuY21wKGNyYywgQ1JDX0JMQUNLLCBDUkNf
TEVOKSAhPSAwKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3686E0C0
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Sep 2018 12:51:25 +0000 (UTC)
MIME-Version: 1.0
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
In-Reply-To: <20180926235701.GJ2262@intel.com>
References: <20180918193044.26123-1-jose.souza@intel.com>
 <20180918193044.26123-2-jose.souza@intel.com>
 <20180919072411.GD5359@kdec5-desk.ger.corp.intel.com>
 <20180926235701.GJ2262@intel.com>
Message-ID: <153805267519.12651.15044490416555985385@jlahtine-desk.ger.corp.intel.com>
Date: Thu, 27 Sep 2018 15:51:15 +0300
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/gpgpu_fill: Implement
 gpgpu_fillfunc for Gen11
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
To: Katarzyna Dec <katarzyna.dec@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBSb2RyaWdvIFZpdmkgKDIwMTgtMDktMjcgMDI6NTc6MDEpCj4gT24gV2VkLCBTZXAg
MTksIDIwMTggYXQgMDk6MjQ6MTFBTSArMDIwMCwgS2F0YXJ6eW5hIERlYyB3cm90ZToKPiA+IE9u
IFR1ZSwgU2VwIDE4LCAyMDE4IGF0IDEyOjMwOjQ0UE0gLTA3MDAsIEpvc8OpIFJvYmVydG8gZGUg
U291emEgd3JvdGU6Cj4gPiA+IEZyb206IEthdGFyenluYSBEZWMgPGthdGFyenluYS5kZWNAaW50
ZWwuY29tPgo+ID4gPiAKPiA+ID4gQWRkZWQgZ2VuMTFfZ3BncHVfZmlsbGZ1bmMgdG8gaGF2ZSBn
cGdwdV9maWxsIHBhc3Npbmcgb24gR2VuMTEuCj4gPiA+IAo+ID4gPiBHcGdwdSBzaGFkZXIgd2Fz
IGdlbmVyYXRlZCB1c2luZyBJR0EgKEludGVsIEdyYXBoaWNzIEFzc2VtYmxlcikKPiA+ID4gYmFz
ZWQgb24gYmluYXJ5IGZvdW5kIGluIGxpYi9ncGdwdV9maWxsLmMgdG8gbWF0Y2ggdGhlCj4gPiA+
IGNoYW5nZXMgaW4gR2VuMTEgSFc6Cj4gPiA+IENoYW5nZWQgJ211bCcgaW5zdHJ1Y3Rpb24gdG8g
J3NobCcgKHNpbmNlIEdlbjExICdtdWwnIGRvZXMKPiA+ID4gbm90IHN1cHBvcnQgaW50ZWdlciB2
YWx1ZXMgZm9yIGJvdGggc3JjIGFuZCBkZXN0KS4KPiA+ID4gQ2hhbmdlZCBTRU5EIG1lc3NhZ2Ug
ZGVzY3JpcHRvciAoaXQgc2hvdWxkIGhhdmUgbGVuZ3RoIDIgbm90IDMpLgo+ID4gPiAKPiA+ID4g
Q2M6IEx1a2FzeiBLYWxhbWFyeiA8bHVrYXN6LmthbGFtYXJ6QGludGVsLmNvbT4KPiA+ID4gQ2M6
IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4KPiA+ID4gVGVzdGVkLWJ5OiBK
b3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogS2F0YXJ6eW5hIERlYyA8a2F0YXJ6eW5hLmRlY0BpbnRlbC5jb20+Cj4gPiA+IFNp
Z25lZC1vZmYtYnk6IEx1a2FzeiBLYWxhbWFyeiA8bHVrYXN6LmthbGFtYXJ6QGludGVsLmNvbT4K
PiA+IAo+ID4gQWNrZWQtYnk6IEthdGFyenluYSBEZWMgPGthdGFyenluYS5kZWNAaW50ZWwuY29t
Pgo+ID4gS2FzaWEgOikKCkknbSBmYWlybHkgc3VyZSB0aGUgYWRkaXRpb24gb2YgdGhlIHNvdXJj
ZSBjb2RlIGFuZCBjb21waWxpbmcKaW5zdHJ1Y3Rpb25zIHdhcyBicm91Z2h0IHVwIGluIHRoZSBl
YXJseSByZXZpZXcgb2YgdGhlIHNlcmllcy4KCkFueSByZWFzb24gbm90IGZvbGxvd2luZyB0aHJv
dWdoIHdpdGggaXQ/CgpSZWdhcmRzLCBKb29uYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2Cg==

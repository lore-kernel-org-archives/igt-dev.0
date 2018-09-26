Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E64891AD
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Sep 2018 23:57:15 +0000 (UTC)
Date: Wed, 26 Sep 2018 16:57:01 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20180926235701.GJ2262@intel.com>
References: <20180918193044.26123-1-jose.souza@intel.com>
 <20180918193044.26123-2-jose.souza@intel.com>
 <20180919072411.GD5359@kdec5-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180919072411.GD5359@kdec5-desk.ger.corp.intel.com>
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
To: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTksIDIwMTggYXQgMDk6MjQ6MTFBTSArMDIwMCwgS2F0YXJ6eW5hIERlYyB3
cm90ZToKPiBPbiBUdWUsIFNlcCAxOCwgMjAxOCBhdCAxMjozMDo0NFBNIC0wNzAwLCBKb3PDqSBS
b2JlcnRvIGRlIFNvdXphIHdyb3RlOgo+ID4gRnJvbTogS2F0YXJ6eW5hIERlYyA8a2F0YXJ6eW5h
LmRlY0BpbnRlbC5jb20+Cj4gPiAKPiA+IEFkZGVkIGdlbjExX2dwZ3B1X2ZpbGxmdW5jIHRvIGhh
dmUgZ3BncHVfZmlsbCBwYXNzaW5nIG9uIEdlbjExLgo+ID4gCj4gPiBHcGdwdSBzaGFkZXIgd2Fz
IGdlbmVyYXRlZCB1c2luZyBJR0EgKEludGVsIEdyYXBoaWNzIEFzc2VtYmxlcikKPiA+IGJhc2Vk
IG9uIGJpbmFyeSBmb3VuZCBpbiBsaWIvZ3BncHVfZmlsbC5jIHRvIG1hdGNoIHRoZQo+ID4gY2hh
bmdlcyBpbiBHZW4xMSBIVzoKPiA+IENoYW5nZWQgJ211bCcgaW5zdHJ1Y3Rpb24gdG8gJ3NobCcg
KHNpbmNlIEdlbjExICdtdWwnIGRvZXMKPiA+IG5vdCBzdXBwb3J0IGludGVnZXIgdmFsdWVzIGZv
ciBib3RoIHNyYyBhbmQgZGVzdCkuCj4gPiBDaGFuZ2VkIFNFTkQgbWVzc2FnZSBkZXNjcmlwdG9y
IChpdCBzaG91bGQgaGF2ZSBsZW5ndGggMiBub3QgMykuCj4gPiAKPiA+IENjOiBMdWthc3ogS2Fs
YW1hcnogPGx1a2Fzei5rYWxhbWFyekBpbnRlbC5jb20+Cj4gPiBDYzogUm9kcmlnbyBWaXZpIDxy
b2RyaWdvLnZpdmlAaW50ZWwuY29tPgo+ID4gVGVzdGVkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNv
dXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEthdGFyenluYSBE
ZWMgPGthdGFyenluYS5kZWNAaW50ZWwuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogTHVrYXN6IEth
bGFtYXJ6IDxsdWthc3oua2FsYW1hcnpAaW50ZWwuY29tPgo+IAo+IEFja2VkLWJ5OiBLYXRhcnp5
bmEgRGVjIDxrYXRhcnp5bmEuZGVjQGludGVsLmNvbT4KPiBLYXNpYSA6KQoKcHVzaGVkLCB0aGFu
a3MKCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBp
Z3QtZGV2IG1haWxpbmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=

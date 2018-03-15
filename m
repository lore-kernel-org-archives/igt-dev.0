Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1F86E851
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Mar 2018 12:51:07 +0000 (UTC)
Date: Thu, 15 Mar 2018 14:51:04 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20180315125104.GP5453@intel.com>
References: <20180315110104.72199-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180315110104.72199-1-maarten.lankhorst@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_kms: Fix enum type in
 igt_pipe_has_prop.
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

T24gVGh1LCBNYXIgMTUsIDIwMTggYXQgMTI6MDE6MDRQTSArMDEwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gRm91bmQgd2hlbiBjb21waWxpbmcgaWd0IHdpdGggY2xhbmc6Cj4gWzI4NC84
MTldIENvbXBpbGluZyBDIG9iamVjdCAndGVzdHMva21zX2NydGNfYmFja2dyb3VuZF9jb2xvckBl
eGUva21zX2NydGNfYmFja2dyb3VuZF9jb2xvci5jLm8nLgo+IC4uL3Rlc3RzL2ttc19jcnRjX2Jh
Y2tncm91bmRfY29sb3IuYzoxNDA6NDg6IHdhcm5pbmc6IGltcGxpY2l0IGNvbnZlcnNpb24gZnJv
bSBlbnVtZXJhdGlvbiB0eXBlCj4gCSdlbnVtIGlndF9hdG9taWNfY3J0Y19wcm9wZXJ0aWVzJyB0
byBkaWZmZXJlbnQgZW51bWVyYXRpb24gdHlwZSAnZW51bSBpZ3RfYXRvbWljX2Nvbm5lY3Rvcl9w
cm9wZXJ0aWVzJyBbLVdlbnVtLWNvbnZlcnNpb25dCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFhcnRl
biBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KClJldmlld2Vk
LWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgoKPiAt
LS0KPiAgbGliL2lndF9rbXMuaCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfa21zLmggYi9saWIv
aWd0X2ttcy5oCj4gaW5kZXggMWM0NjE4NmU4YTlkLi42NzI5MzBlOTg0OWYgMTAwNjQ0Cj4gLS0t
IGEvbGliL2lndF9rbXMuaAo+ICsrKyBiL2xpYi9pZ3Rfa21zLmgKPiBAQCAtNjE1LDcgKzYxNSw3
IEBAIGlndF9waXBlX2dldF9wcm9wKGlndF9kaXNwbGF5X3QgKmRpc3BsYXksIGVudW0gcGlwZSBw
aXBlLAo+ICAgKi8KPiAgc3RhdGljIGlubGluZSBib29sCj4gIGlndF9waXBlX2hhc19wcm9wKGln
dF9kaXNwbGF5X3QgKmRpc3BsYXksIGVudW0gcGlwZSBwaXBlLAo+IC0JCSAgZW51bSBpZ3RfYXRv
bWljX2Nvbm5lY3Rvcl9wcm9wZXJ0aWVzIHByb3ApCj4gKwkJICBlbnVtIGlndF9hdG9taWNfY3J0
Y19wcm9wZXJ0aWVzIHByb3ApCj4gIHsKPiAgCXJldHVybiBkaXNwbGF5LT5waXBlc1twaXBlXS5w
cm9wc1twcm9wXTsKPiAgfQo+IC0tIAo+IDIuMTYuMgo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiBpZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbCBPVEMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

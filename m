Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF066E36D
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2019 11:30:32 +0000 (UTC)
Date: Thu, 18 Jul 2019 14:30:28 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190718113028.GX5942@intel.com>
References: <20190718004331.4603-1-dhinakaran.pandiyan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718004331.4603-1-dhinakaran.pandiyan@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tools/vbt_decode: Fix VBT parsing
 for the PSR section
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

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDU6NDM6MzBQTSAtMDcwMCwgRGhpbmFrYXJhbiBQYW5k
aXlhbiB3cm90ZToKPiBBIHNpbmdsZSAzMi1iaXQgUFNSMiB0cmFpbmluZyBwYXR0ZXJuIGZpZWxk
IGZvbGxvd3MgdGhlIHNpeHRlZW4gZWxlbWVudAo+IGFycmF5IG9mIFBTUiB0YWJsZSBlbnRyaWVz
IGFzIHBlciBWQlQgc3BlYy4gQnV0LCB3ZSBpbmNvcnJlY3RseSBkZWZpbmUKPiB0aGlzIFBTUjIg
ZmllbGQgZm9yIGVhY2ggb2YgUFNSIHRhYmxlIGVudHJpZXMuIFRoZSByZXN1bHQgb2YgdGhpcyBp
cwo+IHRoYXQgdGhlIFBTUjEgdHJhaW5pbmcgcGF0dGVybiBkdXJhdGlvbiBmb3IgYW55IHBhbmVs
X3R5cGUgIT0gMCB3aWxsIGJlCj4gcGFyc2VkIGluY29ycmVjdGx5Lgo+IAo+IENjOiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IENjOiBKb3PDqSBSb2Jl
cnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEaGlu
YWthcmFuIFBhbmRpeWFuIDxkaGluYWthcmFuLnBhbmRpeWFuQGludGVsLmNvbT4KClJldmlld2Vk
LWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgoKPiAt
LS0KPiAgdG9vbHMvaW50ZWxfdmJ0X2RlZnMuaCB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L2ludGVsX3ZidF9kZWZzLmggYi90b29scy9pbnRlbF92YnRfZGVmcy5oCj4gaW5kZXggODllZjE0
Y2EuLmM5MDNjZGEzIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2ludGVsX3ZidF9kZWZzLmgKPiArKysg
Yi90b29scy9pbnRlbF92YnRfZGVmcy5oCj4gQEAgLTQ3NSwxMyArNDc1LDEzIEBAIHN0cnVjdCBw
c3JfdGFibGUgewo+ICAJLyogVFAgd2FrZSB1cCB0aW1lIGluIG11bHRpcGxlIG9mIDEwMCAqLwo+
ICAJdTE2IHRwMV93YWtldXBfdGltZTsKPiAgCXUxNiB0cDJfdHAzX3dha2V1cF90aW1lOwo+IC0K
PiAtCS8qIFBTUjIgVFAyL1RQMyB3YWtldXAgdGltZSBmb3IgMTYgcGFuZWxzICovCj4gLQl1MzIg
cHNyMl90cDJfdHAzX3dha2V1cF90aW1lOwo+ICB9IF9fcGFja2VkOwo+ICAKPiAgc3RydWN0IGJk
Yl9wc3Igewo+ICAJc3RydWN0IHBzcl90YWJsZSBwc3JfdGFibGVbMTZdOwo+ICsKPiArCS8qIFBT
UjIgVFAyL1RQMyB3YWtldXAgdGltZSBmb3IgMTYgcGFuZWxzICovCj4gKwl1MzIgcHNyMl90cDJf
dHAzX3dha2V1cF90aW1lOwo+ICB9IF9fcGFja2VkOwo+ICAKPiAgLyoKPiAtLSAKPiAyLjE3LjEK
Ci0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2DE6E412
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2019 19:28:43 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
In-Reply-To: <20190308190940.GV3888@intel.com>
References: <20190308190107.32514-1-jani.nikula@intel.com>
 <20190308190107.32514-2-jani.nikula@intel.com>
 <20190308190940.GV3888@intel.com>
Date: Fri, 08 Mar 2019 21:28:39 +0200
Message-ID: <87pnr15fo8.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tools/intel_vbt_decode: check
 inconsistent sequence element size
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
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCAwOCBNYXIgMjAxOSwgVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4gd3JvdGU6Cj4gT24gRnJpLCBNYXIgMDgsIDIwMTkgYXQgMDk6MDE6MDdQTSAr
MDIwMCwgSmFuaSBOaWt1bGEgd3JvdGU6Cj4+IENyb3NzIGNoZWNrIGFnYWluc3QgdGhlIGVsZW1l
bnQgZHVtcGVyIHJldHVybiB2YWx1ZSB0byBjYXRjaAo+PiBpbmNvbnNpc3RlbmNpZXMuCj4+IAo+
PiBTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+PiAt
LS0KPj4gIHRvb2xzL2ludGVsX3ZidF9kZWNvZGUuYyB8IDYgKysrKysrCj4+ICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvaW50ZWxfdmJ0
X2RlY29kZS5jIGIvdG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5jCj4+IGluZGV4IGRlNGNjODhhMDZk
ZC4uNWYzZGI4MDhkNzBkIDEwMDY0NAo+PiAtLS0gYS90b29scy9pbnRlbF92YnRfZGVjb2RlLmMK
Pj4gKysrIGIvdG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5jCj4+IEBAIC0xMjg5LDcgKzEyODksMTMg
QEAgc3RhdGljIGNvbnN0IHVpbnQ4X3QgKmR1bXBfc2VxdWVuY2UoY29uc3QgdWludDhfdCAqZGF0
YSwgdWludDhfdCBzZXFfdmVyc2lvbikKPj4gIAkJCW9wZXJhdGlvbl9zaXplID0gKmRhdGErKzsK
Pj4gIAo+PiAgCQlpZiAobWlwaV9lbGVtX2R1bXApIHsKPj4gKwkJCWNvbnN0IHVpbnQ4X3QgKm5l
eHQgPSBkYXRhICsgb3BlcmF0aW9uX3NpemU7Cj4+ICsKPj4gIAkJCWRhdGEgPSBtaXBpX2VsZW1f
ZHVtcChkYXRhLCBzZXFfdmVyc2lvbik7Cj4+ICsKPj4gKwkJCWlmIChvcGVyYXRpb25fc2l6ZSAm
JiBuZXh0ICE9IGRhdGEpCj4+ICsJCQkJcHJpbnRmKCJFcnJvcjogSW5jb25zaXN0ZW50IG9wZXJh
dGlvbiBzaXplOiAlZFxuIiwKPj4gKwkJCQkJb3BlcmF0aW9uX3NpemUpOwo+Cj4gSSBndWVzcyBu
b24tZmF0YWwgZXJyb3IgaXMgYmV0dGVyIHRoYW4gdGhlIGFzc2VydCBJIGhhZC4KCkkgdGhpbmsg
c28gdG9vLiBJIHBpY2tlZCB1cCBwYXRjaGVzIDEgYW5kIDMgZnJvbSB5b3VyIHNlcmllcywgYW5k
IHRoaXMKb25lLCBhbmQgcHVzaGVkIHRoZSBsb3QgdG8gaWd0LgoKVGhhbmtzLApKYW5pLgoKPgo+
IFJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IGZvciBib3RoCj4KPj4gIAkJfSBlbHNlIGlmIChvcGVyYXRpb25fc2l6ZSkgewo+PiAg
CQkJLyogV2UgaGF2ZSBzaXplLCBza2lwLiAqLwo+PiAgCQkJZGF0YSArPSBvcGVyYXRpb25fc2l6
ZTsKPj4gLS0gCj4+IDIuMjAuMQoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBH
cmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

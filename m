Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BDB6E9CE
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2019 12:59:31 +0000 (UTC)
Date: Wed, 30 Oct 2019 14:59:28 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20191030125928.GH25209@platvala-desk.ger.corp.intel.com>
References: <20191025190134.19065-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191025190134.19065-1-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane: Don't test every plane
 on icl+
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMTA6MDE6MzRQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IE9ubHkgdGVzdCBvbmUgcGxhbmUgb2YgZWFjaCB0eXBlIChIRFIsIFNEUiBVViwg
U0RSIFkpIG9uIGljbCsuCj4gRm9yIHRoZSBwdXJwb3NlcyBvZiB2YWxpZGF0aW5nIHBpeGVsIGZv
cm1hdHMgdGhpcyBzaG91bGQgYmUgc3VmZmljaWVudAo+IGFzIHRoZSBwcm9ncmFtbWluZyBvZiBl
YWNoIHBsYW5lIG9mIHRoZSBzYW1lIHR5cGUgaXMgaWRlbnRpY2FsIGFuZAo+IGFzIHN1Y2ggaXQn
cyB1bmxpa2VseSB3ZSdkIGhhdmUgZGlmZmVyZW50IGJ1Z3MgYmV0d2VlbiB0aGVtLgo+IAo+IEFz
IGJlZm9yZSB3ZSdsbCBsZWF2ZSB0aGUgZnVsbCB0ZXN0IHNldCBhdmFpbGFibGUgdG8gYmUgcnVu
IGF0Cj4gdGhlIHVzZXIncyBkaXNjcmV0aW9uIHZpYSAtLWV4dGVuZGVkLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4g
LS0tCj4gIHRlc3RzL2ttc19wbGFuZS5jIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS90ZXN0cy9rbXNfcGxhbmUuYyBiL3Rlc3RzL2ttc19wbGFuZS5jCj4gaW5kZXgg
ODZhM2E2Mjk2ZDI2Li43NjcyMzc0ZjUxNTIgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMva21zX3BsYW5l
LmMKPiArKysgYi90ZXN0cy9rbXNfcGxhbmUuYwo+IEBAIC03NTcsNiArNzU3LDI2IEBAIHN0YXRp
YyBib29sIHRlc3RfZm9ybWF0X3BsYW5lKGRhdGFfdCAqZGF0YSwgZW51bSBwaXBlIHBpcGUsCj4g
IAlyZXR1cm4gcmVzdWx0Owo+ICB9Cj4gIAo+ICtzdGF0aWMgYm9vbCBza2lwX3BsYW5lKGRhdGFf
dCAqZGF0YSwgaWd0X3BsYW5lX3QgKnBsYW5lKQo+ICt7Cj4gKwlpbnQgaW5kZXggPSBwbGFuZS0+
aW5kZXg7Cj4gKwo+ICsJaWYgKGRhdGEtPmV4dGVuZGVkKQo+ICsJCXJldHVybiBmYWxzZTsKPiAr
Cj4gKwlpZiAoIWlzX2k5MTVfZGV2aWNlKGRhdGEtPmRybV9mZCkpCj4gKwkJcmV0dXJuIGZhbHNl
Owo+ICsKPiArCWlmIChwbGFuZS0+dHlwZSA9PSBEUk1fUExBTkVfVFlQRV9DVVJTT1IpCj4gKwkJ
cmV0dXJuIGZhbHNlOwo+ICsKPiArCWlmIChpbnRlbF9nZW4oaW50ZWxfZ2V0X2RybV9kZXZpZChk
YXRhLT5kcm1fZmQpKSA8IDExKQo+ICsJCXJldHVybiBmYWxzZTsKPiArCj4gKwkvKiB0ZXN0IDEg
SERSIHBsYW5lLCAxIFNEUiBVViBwbGFuZSwgMSBTRFIgWSBwbGFuZSAqLwo+ICsJcmV0dXJuIGlu
ZGV4ICE9IDAgJiYgaW5kZXggIT0gMyAmJiBpbmRleCAhPSA1OwoKCk1hZ2ljIG51bWJlcnMsIGJ1
dCB3ZSBjYW4gbWF5YmUgbGV0IHRoYXQgc2xpZGUuIFdoZXJlIGNhbiBvbmUgY2hlY2sKdGhhdCB0
aGVzZSBpbmRpY2VzIGFyZSB0aGUgcGxhbmUgdHlwZXMgc3RhdGVkPwoKCi0tIApQZXRyaSBMYXR2
YWxhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==

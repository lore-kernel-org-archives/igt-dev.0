Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191023090752.23566-2-janusz.krzysztofik@linux.intel.com>
References: <20191023090752.23566-1-janusz.krzysztofik@linux.intel.com>
 <20191023090752.23566-2-janusz.krzysztofik@linux.intel.com>
Message-ID: <157182198261.11484.17059885516266928115@skylake-alporthouse-com>
Date: Wed, 23 Oct 2019 10:13:02 +0100
Subject: Re: [Intel-gfx] [PATCH i-g-t 2/2] tests/gem_exec_reloc: Calculate
 softpin offsets from batch size
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@intel.com>, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBKYW51c3ogS3J6eXN6dG9maWsgKDIwMTktMTAtMjMgMTA6MDc6NTIpCj4gRnJvbTog
SmFudXN6IEtyenlzenRvZmlrIDxqYW51c3oua3J6eXN6dG9maWtAaW50ZWwuY29tPgo+IAo+IFRo
ZSBiYXNpYy1yYW5nZSBzdWJ0ZXN0IGFzc3VtZXMgNGtCIG1pbmltdW0gYmF0Y2ggc2l6ZS4gIE9u
IGZ1dHVyZQo+IGJhY2tlbmRzIHdpdGggcG9zc2libHkgYmlnZ2VyIG1pbmltdW0gYmF0Y2ggc2l6
ZXMgdGhpcyBzdWJ0ZXN0IHdpbGwKPiBmYWlsIGFzIGJ1ZmZlciBvYmplY3RzIG1heSBvdmVybGFw
LiAgVG8gYXZvaWQgb2JqZWN0IG92ZXJsYXBwaW5nLAo+IG9mZnNldHMgbmVlZCB0byBiZSBjYWxj
dWxhdGVkIHdpdGggYWN0dWFsIG1pbmltdW0gYmF0Y2ggc2l6ZSBpbiBtaW5kLgo+IAo+IFJlcGxh
Y2UgaGFyZGNvZGVkIGNvbnN0YW50cyBjb3JyZXNwb25kaW5nIHRvIHRoZSBhc3N1bWVkIDRrQiBt
aW5pbXVtCj4gYmF0Y2ggc2l6ZSB3aXRoIHZhbHVlcyBjYWxjdWxhdGVkIGZyb20gYSB2YXJpYWJs
ZSBzdXBwb3NlZCB0byByZXByZXNlbnQKPiBhY3R1YWwgYmF0Y2ggc2l6ZS4gIEZvciBub3csIHRo
ZSB2YXJpYWJsZSBpcyBzdGlsbCBpbml0aWFsaXplZCB3aXRoIHRoZQo+IDRrQiB2YWx1ZSwgc3Vp
dGFibGUgZm9yIGJhY2tlbmRzIGN1cnJlbnRseSBzdXBwb3J0ZWQgYnkgSUdULgoKWW91IGNvdWxk
IGRvIHRoaXMgZW50aXJlbHkgd2l0aGluIHRoZSByZWxvYyBBUEksIG5vPyBCeSBwcm9iaW5nIHdo
ZXRoZXIKYSA0S2lCIG9mZnNldCBpcyBsZWdhbD8KLUNocmlzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeA==

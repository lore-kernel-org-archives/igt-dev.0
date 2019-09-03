Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 3 Sep 2019 20:50:34 +0300
From: Andi Shyti <andi.shyti@intel.com>
Message-ID: <20190903175003.GC22095@intel.intel>
References: <20190902041548.14919-1-chris@chris-wilson.co.uk>
 <20190902041548.14919-4-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190902041548.14919-4-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t 4/6] Add i915/gem_ctx_persistence
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Jon Bloomfield <jon.bloomfield@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SGkgQ2hyaXMsCgpqdXN0IGEgZmV3IHF1aWNrIHF1ZXN0aW9uIGZyb20gYSBmaXJzdCBsb29rLAoK
PiArLyoqCj4gKyAqIF9fZ2VtX2NvbnRleHRfc2V0X3BlcnNpc3RlbmNlOgo+ICsgKiBAaTkxNTog
b3BlbiBpOTE1IGRybSBmaWxlIGRlc2NyaXB0b3IKPiArICogQGN0eDogaTkxNSBjb250ZXh0IGlk
Cj4gKyAqIEBzdGF0ZTogZGVzaXJlZCBwZXJzaXN0ZW5jZQo+ICsgKgo+ICsgKiBMaWtlIF9fZ2Vt
X2NvbnRleHRfc2V0X3BlcnNpc3RlbmNlKCksIGV4Y2VwdCB3ZSBhc3NlcnQgb24gZmFpbHVyZS4K
PiArICovCj4gK3ZvaWQgZ2VtX2NvbnRleHRfc2V0X3BlcnNpc3RlbmNlKGludCBpOTE1LCB1aW50
MzJfdCBjdHgsIGJvb2wgc3RhdGUpCj4gK3sKPiArCWlndF9hc3NlcnRfZXEoX19nZW1fY29udGV4
dF9zZXRfcGVyc2lzdGVuY2UoaTkxNSwgY3R4LCBzdGF0ZSksIDApOwo+ICt9CgpJcyB0aGlzIHJl
YWxseSByZXF1aXJlZD8gV2Uga25vdyB3aGF0IGNvbWVzIG91dCBvZiB0aGlzLCBpdCdzIHRoZQpz
YW1lIGFzIGNhbGxpbmcgaWd0X2Fzc2VydF9lcSgxLCAyKTsgcmlnaHQ/Cgo+IEBAIC01OCw2ICs2
MywxMCBAQCBpbnQgX19nZW1fY29udGV4dF9nZXRfcGFyYW0oaW50IGZkLCBzdHJ1Y3QgZHJtX2k5
MTVfZ2VtX2NvbnRleHRfcGFyYW0gKnApOwo+ICBpbnQgX19nZW1fY29udGV4dF9zZXRfcHJpb3Jp
dHkoaW50IGZkLCB1aW50MzJfdCBjdHgsIGludCBwcmlvKTsKPiAgdm9pZCBnZW1fY29udGV4dF9z
ZXRfcHJpb3JpdHkoaW50IGZkLCB1aW50MzJfdCBjdHgsIGludCBwcmlvKTsKPiAgCj4gKyNkZWZp
bmUgSTkxNV9DT05URVhUX1BBUkFNX1BFUlNJU1RFTkNFIDB4YgoKd2hhdCBpZiB3ZSB3YW50IHRv
IGFkZCBtb3JlIHBhcmFtZXRlcnMgaW4gdGhlIGRyaXZlcj8gV2Ugd291bGQKbmVlZCB0byByZW1l
bWJlciB0byB1cGRhdGUgdGhpcyBhcyB3ZWxsLgoKPiArCWdlbV9jb250ZXh0X2dldF9wYXJhbShp
OTE1LCAmcCk7Cj4gKwlleHBlY3RlZCA9ICEhcC52YWx1ZTsKPiArCj4gKwlleHBlY3RlZCA9ICFl
eHBlY3RlZDsKCiJleHBlY3RlZCA9ICFwLnZhbHVlIiA/Cgo+ICsJcC52YWx1ZSA9IGV4cGVjdGVk
Owo+ICsJZ2VtX2NvbnRleHRfc2V0X3BhcmFtKGk5MTUsICZwKTsKPiArCWdlbV9jb250ZXh0X2dl
dF9wYXJhbShpOTE1LCAmcCk7Cj4gKwlpZ3RfYXNzZXJ0X2VxKHAudmFsdWUsIGV4cGVjdGVkKTsK
CkFuZGkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

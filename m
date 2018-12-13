Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20181213120636.20292-5-tvrtko.ursulin@linux.intel.com>
References: <20181213120636.20292-1-tvrtko.ursulin@linux.intel.com>
 <20181213120636.20292-5-tvrtko.ursulin@linux.intel.com>
Message-ID: <154470418453.11001.8668967659632498941@skylake-alporthouse-com>
Date: Thu, 13 Dec 2018 12:29:44 +0000
Subject: Re: [Intel-gfx] [PATCH i-g-t 4/4] tests/gem_media_vme: Shut down
 half of subslices to avoid gpu hang on ICL
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0xMi0xMyAxMjowNjozNikKPiArc3RhdGljIHZv
aWQgc2h1dF9ub25fdm1lX3N1YnNsaWNlcyhpbnQgZHJtX2ZkLCB1aW50MzJfdCBjdHgpCj4gK3sK
PiArICAgICAgIHN0cnVjdCBkcm1faTkxNV9nZW1fY29udGV4dF9wYXJhbV9zc2V1IHNzZXUgPSB7
IH07Cj4gKyAgICAgICBzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2NvbnRleHRfcGFyYW0gYXJnID0gewo+
ICsgICAgICAgICAgICAgICAucGFyYW0gPSBJOTE1X0NPTlRFWFRfUEFSQU1fU1NFVSwKPiArICAg
ICAgICAgICAgICAgLmN0eF9pZCA9IGN0eCwKPiArICAgICAgICAgICAgICAgLnNpemUgPSBzaXpl
b2Yoc3NldSksCj4gKyAgICAgICAgICAgICAgIC52YWx1ZSA9IHRvX3VzZXJfcG9pbnRlcigmc3Nl
dSksCj4gKyAgICAgICB9Owo+ICsgICAgICAgaW50IHJldDsKPiArCj4gKyAgICAgICBpZiAoX19n
ZW1fY29udGV4dF9nZXRfcGFyYW0oZHJtX2ZkLCAmYXJnKSkKPiArICAgICAgICAgICAgICAgcmV0
dXJuOyAvKiBubyBzc2V1IHN1cHBvcnQgKi8KPiArCj4gKyAgICAgICByZXQgPSBfX2dlbV9jb250
ZXh0X3NldF9wYXJhbShkcm1fZmQsICZhcmcpOwo+ICsgICAgICAgaWd0X2Fzc2VydChyZXQgPT0g
MCB8fCByZXQgPT0gLUVOT0RFViB8fCByZXQgPT0gLUVJTlZBTCk7Cj4gKyAgICAgICBpZiAocmV0
KQo+ICsgICAgICAgICAgICAgICByZXR1cm47IC8qIG5vIHNzZXUgc3VwcG9ydCAqLwoKLyogbm8g
c3NldSByZWNvbmZpZ3VyYXRpb24gKi8KClRoYXQganVzdGlmaWVzIGZvciBtZSB0aGUgdHdvIHN0
ZXAgaXMtc3VwcG9ydGVkIGNoZWNrLgpnZXQgLT4gZG9lcyB0aGUga2VybmVsIHJlY29nbmlzZSB0
aGlzIHBhcmFtIGFuZCBkbyB3ZSBoYXZlIHNzZXUKc2V0IC0+IGRvZXMgdGhlIGtlcm5lbC9kZXZp
Y2UgYWxsb3cgdXMgdG8gYWRqdXN0IHNzZXUKLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=

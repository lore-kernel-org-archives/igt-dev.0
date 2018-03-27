Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180327164056.6301-1-tvrtko.ursulin@linux.intel.com>
References: <20180327164056.6301-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <152218018504.10679.17153519565017698305@mail.alporthouse.com>
Date: Tue, 27 Mar 2018 20:49:45 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_eio: Never re-use contexts
 which were in the middle of GPU reset
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
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMy0yNyAxNzo0MDo1NikKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IENvbnRleHRzIGV4ZWN1
dGluZyB3aGVuIHJlc2V0IHRyaWdnZXJzIGFyZSBwb3RlbnRpYWx5IGNvcnJ1cHQgc28gdHJ5aW5n
IHRvCj4gdXNlIHRoZW0gZnJvbSBhIHN1YnNlcXVlbnQgdGVzdCAobGlrZSB0aGUgZGVmYXVsdCBj
b250ZXh0KSBjYW4gaGFuZyB0aGUKPiBHUFUgb3IgZXZlbiB0aGUgZHJpdmVyLgo+IAo+IFdvcmth
cm91bmQgdGhhdCBieSBhbHdheXMgY3JlYXRpbmcgYSBkZWRpY2F0ZWQgY29udGV4dCB3aGljaCB3
aWxsIGJlCj4gcnVubmluZyB3aGVuIEdQVSByZXNldCBoYXBwZW5zLgoKSG1tLCB3aGF0IENJIHdv
bid0IHNheSB1bnRpbCBpdCBnZXRzIGFyb3VuZCB0byBydW5uaW5nIG9uIHRoZSBzaGFyZHMKKGku
ZS4gcG9zdCBtZXJnZSkgaXMgdGhhdCB0aGUgIWNvbnRleHRzIHRlc3RzIGFyZSBleHBlY3RlZCB0
byBwYXNzIG9uCnRoZSBvbGRlciBnZW4uIFRoaXMgcGF0Y2ggd2lsbCBub3cgZmFpbCBpbiBnZW1f
Y29udGV4dF9jcmVhdGUoKS4KCkkgd2FzIG9ubHkgaGFsZiBqb2tpbmdseSBzdWdnZXN0aW5nIHJl
b3Blbl9kZXZpY2UoKS4KCkFzIENJIGlzIG9ubHkgcnVubmluZyBlYWNoIHN1YnRlc3QgaW5kaXZp
ZHVhbGx5LCBJIGRvbid0IHRoaW5rIHdlIGFyZQpleHBvc2VkIHRvIHRoZSBpc3N1ZSwgdGhhdCBz
aG91bGQgZ2l2ZSB1cyBhIGJpdCBvZiB0aW1lIHRvIGhvcGVmdWxseSBmaXgKaXQuIFNvIGJhY2sg
dG8gdGhlIHBlcnBsZXhpbmcgcHV6emxlLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2Cg==

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190228141828.2567-1-tvrtko.ursulin@linux.intel.com>
 <20190228141828.2567-2-tvrtko.ursulin@linux.intel.com>
 <155136395323.5847.13177410525767591837@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <5eded0ef-6b8c-06ff-9be7-00e66eb71076@linux.intel.com>
Date: Thu, 28 Feb 2019 14:41:23 +0000
MIME-Version: 1.0
In-Reply-To: <155136395323.5847.13177410525767591837@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 2/5] gem_wsim: Round mmap to
 page size
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDI4LzAyLzIwMTkgMTQ6MjUsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE5LTAyLTI4IDE0OjE4OjI1KQo+PiBGcm9tOiBUdnJ0a28gVXJzdWxpbiA8
dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+Pgo+PiBtbWFwKDIpIG1hbmRhdGVzIHNpemUgaXMg
cGFnZSBhbGlnbmVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtv
LnVyc3VsaW5AaW50ZWwuY29tPgo+PiAtLS0KPj4gICBiZW5jaG1hcmtzL2dlbV93c2ltLmMgfCA3
ICsrKystLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYmVuY2htYXJrcy9nZW1fd3NpbS5jIGIvYmVuY2htYXJr
cy9nZW1fd3NpbS5jCj4+IGluZGV4IDBhNWFiYzA4ZDhjMi4uNTdjZWI5ODNjZjgyIDEwMDY0NAo+
PiAtLS0gYS9iZW5jaG1hcmtzL2dlbV93c2ltLmMKPj4gKysrIGIvYmVuY2htYXJrcy9nZW1fd3Np
bS5jCj4+IEBAIC03MzcsNiArNzM3LDcgQEAgaW5pdF9iYihzdHJ1Y3Qgd19zdGVwICp3LCB1bnNp
Z25lZCBpbnQgZmxhZ3MpCj4+ICAgewo+PiAgICAgICAgICBjb25zdCB1bnNpZ25lZCBpbnQgYXJi
X3BlcmlvZCA9Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBnZXRfYmJfc3oody0+cHJlZW1w
dF91cykgLyBzaXplb2YodWludDMyX3QpOwo+PiArICAgICAgIGNvbnN0IHVuc2lnbmVkIGludCBt
bWFwX2xlbiA9IEFMSUdOKHctPmJiX3N6LCA0MDk2KTsKPj4gICAgICAgICAgdW5zaWduZWQgaW50
IGk7Cj4+ICAgICAgICAgIHVpbnQzMl90ICpwdHI7Cj4gCj4gWW91IG9ubHkgbmVlZCB0byBkbyBp
dCBmb3IKPiAKPiB3dy0+YmJfc3ogPSBBTElHTihnZXRfYmJfc3ooKSwgNDA5Nik7Cj4gCj4gQWxs
IGJhdGNoIGxlbmd0aHMgYXJlIHN0YXJ0ID0gd3ctPmJiX3N6IC0gZ2V0X2JiX3N6KCkgYW5kIHNv
IHJlbWFpbgo+IGNvcnJlY3QuIFJpZ2h0PwoKSSB0aGluayBzby4gSSBoYXZlIG9uZSBtb3JlIGFz
c2lnbm1lbnQgc2l0ZSBvZiB3LT5iYl9zeiBpbiB0aGUgdXBjb21pbmcgCmNvZGUgc28gaXQgd2Fz
IDIgOiAyIGFuZCBJIGZsaXBwZWQgYSBjb2luLiBBY3R1YWxseSBJIHdhbnRlZCB0byBtYWtlIGl0
IApleHBsaWNpdCB3aGF0IEkgYW0gZml4aW5nIC0gdGhlIG1tYXAgc2l6ZS4gQnV0IG5vdyB5b3Un
bGwgc2F5IGJhdGNoIHNpemUgCmlzIGFsc28gaW1wbGljaXRseSByb3VuZGVkLi4gb2ggd2VsbC4u
IEkgcHJlZmVyIHRoZSBleHBsaWNpdCByb3VuZCB1cCBhdCAKbW1hcCB0aW1lLgoKUmVnYXJkcywK
ClR2cnRrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=

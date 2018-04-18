Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20180306124315.30208-1-tvrtko.ursulin@linux.intel.com>
 <20180306124315.30208-7-tvrtko.ursulin@linux.intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <237227fc-52d1-1bdb-0456-cc47cab9f46a@intel.com>
Date: Wed, 18 Apr 2018 09:56:13 -0700
MIME-Version: 1.0
In-Reply-To: <20180306124315.30208-7-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 06/11] trace.pl: Move
 sortQueue near its user
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVs
LmNvbT4KCk9uIDA2LzAzLzE4IDA0OjQzLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToKPiBGcm9tOiBU
dnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+Cj4gSnVzdCB0byBjbGVh
ciB1cCBzb21lIHNwYWNlIGZvciBpbmNvbWluZyBjb2RlIHJlZmFjdG9yaW5nLgo+Cj4gU2lnbmVk
LW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KPiBDYzog
Sm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQGludGVsLmNvbT4KPiAtLS0KPiAgIHNjcmlw
dHMvdHJhY2UucGwgfCAyMiArKysrKysrKysrKy0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvc2Ny
aXB0cy90cmFjZS5wbCBiL3NjcmlwdHMvdHJhY2UucGwKPiBpbmRleCA1MDlkZjZjMGRkOGIuLmQ0
OWQyNWQ2YzFjYSAxMDA3NTUKPiAtLS0gYS9zY3JpcHRzL3RyYWNlLnBsCj4gKysrIGIvc2NyaXB0
cy90cmFjZS5wbAo+IEBAIC01NDUsMTcgKzU0NSw2IEBAIHN1YiBzb3J0U3RhcnQgewo+ICAgCXJl
dHVybiAkdmFsOwo+ICAgfQo+ICAgCj4gLXN1YiBzb3J0UXVldWUgewo+IC0JbXkgJGFzID0gJGRi
eyRhfS0+eydxdWV1ZSd9Owo+IC0JbXkgJGJzID0gJGRieyRifS0+eydxdWV1ZSd9Owo+IC0JbXkg
JHZhbDsKPiAtCj4gLQkkdmFsID0gJGFzIDw9PiAkYnM7Cj4gLQkkdmFsID0gJGEgY21wICRiIGlm
ICR2YWwgPT0gMDsKPiAtCj4gLQlyZXR1cm4gJHZhbDsKPiAtfQo+IC0KPiAgIG15IEBzb3J0ZWRf
a2V5cyA9IHNvcnQgc29ydFN0YXJ0IGtleXMgJWRiOwo+ICAgbXkgJHJlX3NvcnQgPSAwOwo+ICAg
Cj4gQEAgLTg1OSw2ICs4NDgsMTcgQEAgcHJpbnQgPDxFTkRIVE1MOwo+ICAgICB2YXIgaXRlbXMg
PSBuZXcgdmlzLkRhdGFTZXQoWwo+ICAgRU5ESFRNTAo+ICAgCj4gK3N1YiBzb3J0UXVldWUgewo+
ICsJbXkgJGFzID0gJGRieyRhfS0+eydxdWV1ZSd9Owo+ICsJbXkgJGJzID0gJGRieyRifS0+eydx
dWV1ZSd9Owo+ICsJbXkgJHZhbDsKPiArCj4gKwkkdmFsID0gJGFzIDw9PiAkYnM7Cj4gKwkkdmFs
ID0gJGEgY21wICRiIGlmICR2YWwgPT0gMDsKPiArCj4gKwlyZXR1cm4gJHZhbDsKPiArfQo+ICsK
PiAgIG15ICRpID0gMDsKPiAgIGZvcmVhY2ggbXkgJGtleSAoc29ydCBzb3J0UXVldWUga2V5cyAl
ZGIpIHsKPiAgIAlteSAoJG5hbWUsICRjdHgsICRzZXFubykgPSAoJGRieyRrZXl9LT57J25hbWUn
fSwgJGRieyRrZXl9LT57J2N0eCd9LCAkZGJ7JGtleX0tPnsnc2Vxbm8nfSk7CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcg
bGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F856E1B3
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Oct 2018 07:35:57 +0000 (UTC)
References: <20181008081800.1953-1-stanislav.lisovskiy@intel.com>
 <ce53193d-4334-dc15-2073-a8a3921273f3@linux.intel.com>
 <a6968cc36efede8658fe4b7e1ac6323a108669ce.camel@intel.com>
 <72e51cb3-c919-9dbc-48d7-e6673785fa2b@linux.intel.com>
 <903505fea5282bddbbe832a56bd91447ae95c090.camel@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <532ccb79-1324-7a1e-92e6-7f12c14d6f26@linux.intel.com>
Date: Wed, 24 Oct 2018 09:35:54 +0200
MIME-Version: 1.0
In-Reply-To: <903505fea5282bddbbe832a56bd91447ae95c090.camel@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v10] lib/igt_fb: Added XYUV format
 support for testing
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
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Syrjala, Ville" <ville.syrjala@intel.com>, "Peres,
 Martin" <martin.peres@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMjQtMTAtMTggb20gMDg6NDIgc2NocmVlZiBMaXNvdnNraXksIFN0YW5pc2xhdjoKPiBPbiBU
dWUsIDIwMTgtMTAtMjMgYXQgMTU6NTQgKzAyMDAsIE1hYXJ0ZW4gTGFua2hvcnN0IHdyb3RlOgo+
PiBPcCAyMy0xMC0xOCBvbSAxNTo1MSBzY2hyZWVmIExpc292c2tpeSwgU3RhbmlzbGF2Ogo+Pj4g
T24gVHVlLCAyMDE4LTEwLTIzIGF0IDEzOjMzICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToKPj4+PiBPcCAwOC0xMC0xOCBvbSAxMDoxOCBzY2hyZWVmIFN0YW5pc2xhdiBMaXNvdnNraXk6
Cj4+Pj4+IFhZVVYgZm9ybWF0IHN1cHBvcnQgaGFzIGJlZW4gYWRkZWQgdG8gRFJNLCBtb2RpZmll
ZAo+Pj4+PiBJR1QgdG8gcmVmbGVjdCB0aG9zZSBjaGFuZ2VzLgo+Pj4+Pgo+Pj4+PiB2MjogRml4
ZWQgbWVyZ2UgY29uZmxpY3QsIHN0YXJ0ZWQgdG8gdXNlIG5ldyB5dXY8PT5yZ2IKPj4+Pj4gICAg
IGNvbnZlcnNpb24gZnVuY3Rpb25zLgo+Pj4+Pgo+Pj4+PiB2MzogRml4ZWQga21zX2F2YWlsYWJs
ZV9tb2Rlc19jcmMgdGVzdCB0byBzdXBwb3J0IG5ldyBYWVVWCj4+Pj4+ICAgICBmb3JtYXQuIEZp
eGVkIGEgcHJvYmxlbSwgd2hlcmUgdGVzdCBjb21wbGFpbnMgdGhhdCB0d28KPj4+Pj4gICAgIG91
dHB1dHMgbWlnaHQgdXNlIHNhbWUgcGlwZSBhdCB0aGUgc2FtZSB0aW1lLgo+Pj4+Pgo+Pj4+PiB2
NDogRml4ZWQgY29udmVydGlvbiBwcm9jZWR1cmUgaW4gaWd0X2ZiIHRvIHN1cHBvcnQgWFlVVgo+
Pj4+PiAgICAgcHJvcGVybHkuCj4+Pj4+Cj4+Pj4+IHY1OiBGaXhlZCBhIGNvZGluZyB0eXBvLgo+
Pj4+Pgo+Pj4+PiB2NjogU2V0IGRlcHRoIGVxdWFsIHRvIC0xIGZvciBYWVVWIGZvcm1hdCBpbiBv
cmRlciB0byBwcmV2ZW50Cj4+Pj4+ICAgICBpdCB0byBiZSB1c2VkIGJ5IGlndF9icHBfZGVwdGhf
dG9fZHJtX2Zvcm1hdCwgYXMgd2UgZG8gbm90Cj4+Pj4+ICAgICB3YW50IFlVViBmb3JtYXRzIHRv
IGJlIHVzZWQgaW4gdGhhdCBjYXNlLgo+Pj4+Pgo+Pj4+PiB2NzogRml4ICJibGFjayIgY29sb3Ig
aW5pdGlhbGl6YXRpb24gZm9yIGNyZWF0ZV9ib19mb3JfZmIgd2l0aAo+Pj4+PiAgICAgcHJvcGVy
IHZhbHVlLiBDaGFuZ2VkIG5hbWluZyAicGxhbmFyX3N0cmlkZSIgdG8KPj4+Pj4gInh5dXZfc3Ry
aWRlIi4KPj4+Pj4KPj4+Pj4gdjg6IENoYW5nZSBuYW1pbmcgZnJvbSBEUk1fRk9STUFUX1hZVVYg
dG8gRFJNX0ZPUk1BVF9YWVVWODg4OAo+Pj4+Pgo+Pj4+PiB2OTogRml4ZWQgY29tcGlsYXRpb24g
ZXJyb3JzIGJ5IHJlYmFzaW5nIHRvIHJlY2VudCBtYXN0ZXIuCj4+Pj4+Cj4+Pj4+IHYxMDogQWRk
aW5nIHJlZmVyZW5jZSB0byBjb3JyZXNwb25kZW50IGtlcm5lbCBjb21taXQgd2l0aCB0aGUKPj4+
Pj4gbmV3Cj4+Pj4+IGZvcm1hdAo+Pj4+PiAgICAgIGluIGluY2x1ZGUvZHJtLXVhcGkKPj4+Pj4K
Pj4+Pj4gZHJtLXRpcDoKPj4+Pj4gCWNvbW1pdCBmNzVkZjJjYWQ5ODZmNDBlMTkwZWU5N2ZlM2I0
OWRkMTcxNzRmMWFmCj4+Pj4+IAlBdXRob3I6IFN0YW5pc2xhdiBMaXNvdnNraXkgPHN0YW5pc2xh
di5saXNvdnNraXlAaW50ZWwuCj4+Pj4+IGNvbT4KPj4+Pj4gCURhdGU6ICAgRnJpIEp1bCA2IDEx
OjU3OjI3IDIwMTggKzAzMDAKPj4+Pj4KPj4+Pj4gCSAgICBkcm06IEludHJvZHVjZSBuZXcgRFJN
X0ZPUk1BVF9YWVVWCj4+Pj4gSW4gd2hhdCB0cmVlIGlzIHRoaXMgY29tbWl0IGluY2x1ZGVkPyBJ
IGRvbid0IHNlZSBpdCBpbiBkcm0tdGlwLAo+Pj4+IGRybS0KPj4+PiBpbnRlbCBvciBkcm0tbWlz
Yy4KPj4+IFRoZSBwYXRjaCBpcyB1bmRlciByZXZpZXcgc3RpbGwuIEl0IGdvdCAiUmV2aWV3ZWQt
YnkiIGp1c3QgbGFzdAo+Pj4gd2Vlay4KPj4gVGhlbiB0aGVyZSdzIG5vIHNlbnNlIGluIGxpbmtp
bmcgdG8gYSBjb21taXQsIGEgY29tbWl0IElEIG9ubHkgZXhpc3RzCj4+IGlmIGl0J3MgaW4gZHJt
LW1pc2Mgb3IgZHJtLWludGVsLiA6KQo+Pgo+IFRvdGFsbHkgYWdyZWUgOikgSSB3YXMgYXNrZWQg
dG8gaW5jbHVkZSB0aGUgY29tbWl0IGlkLCBidXQgcHJvYmFibHkgSQo+IG1pc3VuZGVyc3Rvb2Qg
dGhlIHJlcXVlc3QuIFNob3VsZCBpdCBiZSBpbmNsdWRlZCBvbmNlLCB0aGUga2VybmVsIGNvZGUK
PiBpcyBpbiBkcm0tdGlwPwo+Cj4+IH5NYWFydGVuCgpZZXMsIGJlZm9yZSB0aGF0IHlvdSBjYW5u
b3QgaW5jbHVkZSBpdCBzaW5jZSBpdCBvbmx5IGV4aXN0cyBvbiB5b3VyIG93biBtYWNoaW5lLiA6
KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

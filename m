Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DF36E3CD
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Apr 2018 11:23:54 +0000 (UTC)
Date: Tue, 24 Apr 2018 13:23:47 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <20180424112347.724v4j3z5c7fp65r@mwiniars-main.ger.corp.intel.com>
References: <20180424083212.11479-1-lukasz.kalamarz@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180424083212.11479-1-lukasz.kalamarz@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6 1/4] lib/rendercopy_gen7:
 Reorganizing batch allocations
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
To: Lukasz Kalamarz <lukasz.kalamarz@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBBcHIgMjQsIDIwMTggYXQgMTA6MzI6MDlBTSArMDIwMCwgTHVrYXN6IEthbGFtYXJ6
IHdyb3RlOgo+IFRoaXMgbGliIHdhcyB3cml0dGVuIGluIGEgZGlmZmVyZW50IG1hbm5lciB0aGFu
IGFsbCBvdGhlciBsaWJzLAo+IHdoaWNoIHdhcyBjYXVzaW5nIHNvbWUgaXNzdWVzIGR1cmluZyBy
ZWZhY3RvcmluZy4gUHJldmlvdXMKPiBpbXBsZW1lbnRhdGlvbiB3YXMgdXNpbmcgdHdvIHBvaW50
ZXJzIChwdHIgYW5kIHN0YXRlKSB0bwo+IGFjY2VzcyB0d28gcGFydHMgb2YgYmF0Y2hidWZmZXIg
aW4gdGhlIHNhbWUgdGltZS4gQ3VycmVudAo+IGltcGxlbWVudGF0aW9uIGlzIHJldXNpbmcgcHRy
IHdpdGggYSBkb3duc2lkZSBvZiBuZWVkaW5nCj4gdG8gZW5zdXJlIHRoZSBzdGF0ZS9jb21tYW5k
IG9yZGVyaW5nIGlzIHByb3Blci4KPiAKPiB2MzogTW9kaWZpZWQgY29tbWl0IG1lc3NhZ2UgYW5k
IGFkZGVkIGJhdGNoIGJvdW5kYXJ5IGNoZWNrCj4gdjU6IFJlYmFzZQo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEx1a2FzeiBLYWxhbWFyeiA8bHVrYXN6LmthbGFtYXJ6QGludGVsLmNvbT4KPiBDYzogS2F0
YXJ6eW5hIERlYyA8a2F0YXJ6eW5hLmRlY0BpbnRlbC5jb20+Cj4gQ2M6IFJhZG9zbGF3IFN6d2lj
aHRlbmJlcmcgPHJhZG9zbGF3LnN6d2ljaHRlbmJlcmdAaW50ZWwuY29tPgo+IENjOiBEYW5pZWxl
IENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPgo+IFJldmll
d2VkLWJ5OiBLYXRhcnp5bmEgRGVjIDxrYXRhcnp5bmEuZGVjQGludGVsLmNvbT4KPiBSZXZpZXdl
ZC1ieTogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVs
LmNvbT4KClB1c2hlZCB0aGlzIG9uZSBhbmQgcmVsYXRlZCBnZW42IHR3ZWFrcy4KClRoYW5rcyBm
b3IgdGhlIHBhdGNoZXMgYW5kIHRoZSByZXZpZXchCgotTWljaGHFggoKPiAtLS0KPiAgbGliL3Jl
bmRlcmNvcHlfZ2VuNy5jIHwgNzcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAzMiBk
ZWxldGlvbnMoLSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

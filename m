Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA016F144
 for <igt-dev@lists.freedesktop.org>; Fri, 11 May 2018 13:52:23 +0000 (UTC)
Date: Fri, 11 May 2018 15:52:21 +0200
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20180511135221.GA8612@kdec5-desk.ger.corp.intel.com>
References: <20180504130218.6136-4-katarzyna.dec@intel.com>
 <20180507123651.6138-1-katarzyna.dec@intel.com>
 <cc6e32bb-0362-b48b-fff1-20d592b1108b@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc6e32bb-0362-b48b-fff1-20d592b1108b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 4/5] lib/gpu_fill: Further code
 unification in gpu_fill
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
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBNYXkgMTAsIDIwMTggYXQgMDg6NDE6MjdBTSAtMDcwMCwgRGFuaWVsZSBDZXJhb2xv
IFNwdXJpbyB3cm90ZToKPiAKPiAKPiBPbiAwNy8wNS8xOCAwNTozNiwgS2F0YXJ6eW5hIERlYyB3
cm90ZToKPiA+IFdlIGNhbiB1bmlmeSBnZW43X2VtaXRfdmZlX3N0YXRlIGFuZCBnZW44X2VtaXRf
dmZlX3N0YXRlCj4gPiBmdW5jdGlvbnMgZm9yIGdwZ3B1L21lZGlhX2ZpbGwgYW5kIG1lZGlhX3Nw
aW4gYnkgYWRkaW5nCj4gPiBwYXJhbWV0ZXJzLiBnZW44X2VtaXRfbWVkaWFfb2JqZWN0IHdhcyBy
ZW5hbWVkIHRvIGdlbl8qCj4gPiBhbmQgZXh0ZW5kZWQgd2l0aCBhZGRpdGlvbmFsIG9mZnNldCBw
YXJhbWV0ZXJzIC0gd2UgY2FuCj4gPiBoYXZlIG9uZSBnZW43X2VtaXRfbWVkaWFfb2JqZWN0cyBm
b3IgYWxsIHRlc3RzLgo+ID4gSSBoYXZlIHJlbmFtZWQgZ2VuOF9lbWl0X21lZGlhX29iamVjdCB0
byBnZW5fZW1pdF8qLCBiZWNhdXNlCj4gPiBmdW5jdGlvbiBiZWxvbmdzIHRvIGFsbCBnZW5zIGFu
ZCBpdCB3b3VsZCBiZSBvZGQgdG8gaGF2ZQo+ID4gYWxsIG5hbWVkIGdlblhfKiBhbmQgb25seSBv
bmUgd2l0aG91dCB0aGlzIHByZWZpeC4KPiA+IAo+ID4gdjI6IFVzZSAjZGVmaW5lcyBpbnN0ZWFk
IG9mIHZhcmlhYmxlcyBhcyBlbWl0X3ZmZV9zdGF0ZSBwYXJhbWV0ZXJzLgo+ID4gRml4ZWQgZ2Vu
N19lbWl0X21lZGlhX29iamVjdHMuIFVuaWZpZWQgdmZlIHN0YXRlIHBhcmFtZXRlcnMKPiA+IGlu
IG1lZGlhX3NwaW4gbGlicmFyeSBmb3IgZ2VuOCBhbmQgZ2VuOSAoZ2VuOSBoYWQgZGlmZmVyZW50
IHZhbHVlcwo+ID4gYnkgbWlzdGFrZSkuCj4gPiB2MzogRml4ZWQgYnVnIGluIGVtaXRfdmZlX3N0
YXRlIGZvciBnZW44IGFuZCBnZW45IGluIGdwZ3B1X2ZpbGwuCj4gPiBNb3ZlZCAjZGVmaW5lcyBm
b3IgZW1pdF92ZmVfc3RhdGUgdG8gcGFydGljdWxhciBsaWJyYXJpZXMuCj4gPiAKPiA+IFNpZ25l
ZC1vZmYtYnk6IEthdGFyenluYSBEZWMgPGthdGFyenluYS5kZWNAaW50ZWwuY29tPgo+ID4gQ2M6
IEx1a2FzeiBLYWxhbWFyeiA8bHVrYXN6LmthbGFtYXJ6QGludGVsLmNvbT4KPiA+IENjOiBBbnRv
bmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRlbC5jb20+Cj4gPiBDYzogRGFu
aWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4KPiA+
IC0tLQo+IAo+IFJldmlld2VkLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNl
cmFvbG9zcHVyaW9AaW50ZWwuY29tPgo+IAo+IEEgY291cGxlIG9mIHN0eWxlIG5pdHBpY2tzIGJl
bG93LCB5b3UgY2FuIGZpeCB0aGVtIGlmIHlvdSBuZWVkIHRvIHJlLXNwaW4uCj4gQlRXLCB0aGlz
IHBhdGNoIGNvbmZsaWN0cyB3aXRoIHRoZSBvbmUgdG8gdW5pZnkgdGhlIG1lZGlhX2ZpbGwgZmls
ZXMgc28KPiB5b3UnbGwgbmVlZCB0byByZWJhc2Ugb25lIG9mIHRoZSAyIHNlcmllcyBvbiB0b3Ag
b2YgdGhlIG90aGVyLgo+IAo+IERhbmllbGUKPgpUaGFua3MhIEkgYXBwbGllZCBzdHlsZSBuaXRw
aWNrcyBhcyB3ZWxsIHRvIG5ldyB2ZXJzaW9uLgoKS2FzaWEgOikKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgo=

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AC76E10A
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2019 22:22:26 +0000 (UTC)
Message-ID: <1e235670d77eefa98744fb1ee7372e5fa6fff9fb.camel@intel.com>
From: Caz Yokoyama <Caz.Yokoyama@intel.com>
Date: Wed, 13 Mar 2019 15:29:08 -0700
In-Reply-To: <155251153190.30003.15303697863062228863@skylake-alporthouse-com>
References: <ea532fec06df0e24c4cd1fa7f87b4aa6a540662c.1552524267.git.caz.yokoyama@intel.com>
 <155251153190.30003.15303697863062228863@skylake-alporthouse-com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/1] i915_pm_rpm:
 gem-execbuf-stress-extra-wait faster
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Q2hyaXMsCgpBcyBJIHNhaSBvbiBUdWUsIDEyIE1hciAyMDE5IDA5OjExOjE0IC0wNzAwLApNeSBp
bnRlbnRpb24gaXMgdG8gcmVtb3ZlIGdlbS1leGVjYnVmLXN0cmVzcy1leHRyYS13YWl0IHN1YnRl
c3QKYmVjYXVzZSBpdCBkb2VzIHNhbWUgYXMgZ2VtLWV4ZWNidWYtc3RyZXNzIGV4Y2VwdCBmb3Ig
bWVhbmluZ2xlc3MgKDEwIHgKNSBzZWMpIGRlbGF5LgoKSSBiZWxpZXZlIHRoZSBkZWxheSBwcm92
aWRlcyBubyBleHRyYSBjb3ZlcmFnZS4gSXQgbWF5IGJlIGFkZGVkIGFzIHNhbWUKYXMgb3RoZXIg
c3VidGVzdCBzdWNoIGFzIG1vZGVzZXRfc3VidGVzdCgpLiBXQUlUX0VYVFJBIG1heSBwcm92aWRl
CmV4dHJhIGNvdmVyYWdlIGZvciBtb2Rlc2V0X3N1YnRlc3QoKSB3aGlsZSBpdCBkb2VzIG5vdCBm
b3IgZ2VtLWV4ZWNidWYtCnN0cmVzcy4KLWNhegoKT24gV2VkLCAyMDE5LTAzLTEzIGF0IDIxOjEy
ICswMDAwLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gUXVvdGluZyBDYXogWW9rb3lhbWEgKDIwMTkt
MDMtMTQgMDA6NDY6MDgpCj4gPiBSZXBsYWNlICg1c2VjICogMTApIGRlbGF5IGJ5IGZvcmNpbmcg
dG8gc3VzcGVuZGVkIHN0YXRlLgo+ID4gV2hpbGUgdGhpcyBwYXRjaCBleHBlY3RzIGEgY29ycmVz
cG9uZGluZyBwYXRjaCBpbiBkcm0tdGlwLAo+ID4gdGhlIHRlc3QgcnVucyBzdWNjZXNzZnVsIHdp
dGhvdXQgdGhlIGNvcnJlc3BvbmRpbmcgcGF0Y2guCj4gPiBJdHMgcnVudGltZSBpcyAyLTMgc2Vj
IG9uIG15IGxvY2FsIG1hY2hpbmUsIG51Yy4KPiAKPiBXQUlUX0VYVFJBIGlzIGFsd2F5cyBiZWlu
ZyB1c2VkIGluIGNvbmp1bmN0aW9uIHdpdGggV0FJVF9TVEFUVVMsIHNvCj4gaXQKPiBzaW1wbHkg
aXMgY2hlY2tpbmcgdGhhdCB0aGluZ3MgZG8gbm90IGJyZWFrIHdpdGggYW4gZXh0cmEgc2xlZXAg
YWZ0ZXIKPiBzdXNwZW5kaW5nLgo+IAo+IFJlbW92aW5nIHRoYXQgZGVsYXkgbmVyZnMgdGhlIHRl
c3QsIHlvdSBtYXkgYXMgd2VsbCBzaW1wbHkgbm90IHJ1bgo+IHRoZQo+IHRlc3QuCj4gCj4gSW5z
dGVhZCBvZiByZW1vdmluZyB0aGUgZGVsYXkgd2UgbmVlZCB0byBiZSByZXBsYWNpbmcgdGhlIGRl
bGF5IHdpdGgKPiBzb21ldGhpbmcgbW9yZSBsaWtlbHkgdG8gdHJpZ2dlciBhIGJ1Zywgb3IganVz
dCByZW1vdmUgdGhlIHRlc3QgYXMgd2UKPiBiZWxpZXZlIGl0IHByb3ZpZGVzIG5vIGV4dHJhIGNv
dmVyYWdlLgo+IC1DaHJpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

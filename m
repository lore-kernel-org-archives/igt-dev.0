Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A684896E5
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Oct 2018 07:53:37 +0000 (UTC)
Date: Thu, 4 Oct 2018 10:53:32 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20181004075332.6hkrvkk2ta3x5qko@ahiler-desk1.fi.intel.com>
References: <20181003134840.28876-1-katarzyna.dec@intel.com>
 <20181003134840.28876-2-katarzyna.dec@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181003134840.28876-2-katarzyna.dec@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] shaders: Add assembler
 instructions and update README for shaders
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
To: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDMsIDIwMTggYXQgMDM6NDg6MzlQTSArMDIwMCwgS2F0YXJ6eW5hIERlYyB3
cm90ZToKPiBXZSdyZSBub3QgcGxhbm5pbmcgdG8gd29yayBvbiBhc3NlbWJsZXIgaW4gaWd0IGFu
eW1vcmUsIHNpbmNlIHdlIGNhbgo+IHJldXNlIGFuIGV4aXN0aW5nIHByb2plY3QgKElHQSkgdGhh
dCB3aWxsIGRvIHRoaXMgd29yayBmb3IgdXMuIFRoZQo+IG9ubHkgZXh0cmEgdGhpbmcgd2UgbmVl
ZCB0byBkbyBpcyBjb252ZXJ0IHRoZSByZXN1bHQgYmluYXJ5IHRvIEMtYXJyYXksCj4gc2ltcGxl
IHB5dGhvbiBzY3JpcHQuCj4gCj4gdjI6IE1vdmVkIGNvbnZlcnRlciB0byBzaW5nbGUgZmlsZS4g
Rml4ZWQgUkVBRE1FIGZvciBzaGFkZXJzLgo+IHYzOiBGaXhlZCB0eXBvcy4KPiB2NDogVXNlZCBw
eXRob24zIGluIGNvbnZlcnRlci4gQWRkZWQgJ3VzYWdlJyBzZWN0aW9uIHRvIHNjcmlwdC4gRHJv
cGVkCj4gcmVhZG1lIGZpbGVzIGZvciBwYXJ0aWN1bGFyIHNoYWRlcnMgYW5kIGNvbnNvbGlkYXRl
ZCBhbGwgbmVlZGVkCj4gaW5mb3JtYXRpb24gaW4gb25lIGdlbmVyYWwgZmlsZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBLYXRhcnp5bmEgRGVjIDxrYXRhcnp5bmEuZGVjQGludGVsLmNvbT4KPiBDYzog
QXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgo+IENjOiBQZXRyaSBM
YXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KPiBDYzogS2FsYW1hcnogTHVrYXN6IDxs
dWthc3oua2FsYW1hcnpAaW50ZWwuY29tPgo+IENjOiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9u
aW8uYXJnZW56aWFub0BpbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogQXJrYWRpdXN6IEhpbGVyIDxh
cmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgoKYW5kIG1lcmdlZCwgdGhhbmtzIQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

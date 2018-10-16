Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4E96E1D4
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Oct 2018 09:15:57 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20181015134338.9109-1-maarten.lankhorst@linux.intel.com>
 <20181015135746.GA9144@intel.com>
 <a85c6388-fba2-197e-4759-75b660778a3b@linux.intel.com>
Message-ID: <83b1081f-f55a-c865-8c8d-fb5262e38c3f@linux.intel.com>
Date: Tue, 16 Oct 2018 11:15:55 +0200
MIME-Version: 1.0
In-Reply-To: <a85c6388-fba2-197e-4759-75b660778a3b@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_frontbuffer_tracking: Do not
 skip on 4k displays.
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
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMTUtMTAtMTggb20gMTY6MTQgc2NocmVlZiBNYWFydGVuIExhbmtob3JzdDoKPiBPcCAxNS0x
MC0xOCBvbSAxNTo1NyBzY2hyZWVmIFZpbGxlIFN5cmrDpGzDpDoKPj4gT24gTW9uLCBPY3QgMTUs
IDIwMTggYXQgMDM6NDM6MzhQTSArMDIwMCwgTWFhcnRlbiBMYW5raG9yc3Qgd3JvdGU6Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXgu
aW50ZWwuY29tPgo+Pj4gLS0tCj4+PiAgdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMg
fCAyICstCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jIGIv
dGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKPj4+IGluZGV4IDlhZWNiODE1MDI0Zi4u
YmY0YTY4ZmYyYmRlIDEwMDY0NAo+Pj4gLS0tIGEvdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNr
aW5nLmMKPj4+ICsrKyBiL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCj4+PiBAQCAt
MjQ2LDcgKzI0Niw3IEBAIHN0cnVjdCB7Cj4+PiAgCS5zaG93X2hpZGRlbj0gZmFsc2UsCj4+PiAg
CS5zdGVwID0gMCwKPj4+ICAJLm9ubHlfcGlwZXMgPSBQSVBFX0NPVU5ULAo+Pj4gLQkuc2hhcmVk
X2ZiX3hfb2Zmc2V0ID0gNTAwLAo+Pj4gKwkuc2hhcmVkX2ZiX3hfb2Zmc2V0ID0gMjQ4LAo+PiBD
YW4ndCBzZWUgd2h5IDUwMCB3b3VsZCBiZSBpbmhlcmVudGx5IGJldHRlciB0aGFuIDI0OC4gQWx0
aG91Z2ggSSBoYXZlCj4+IHRvIHdvbmRlciB3aHkgMjQ4IGluc3RlYWQgb2YgZWcuIDI1Ni4gTWFn
aWMgbnVtYmVycyBhcmUganVzdCB0aGF0Lgo+Pgo+PiBSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBJJ20gZmluZSB3aXRoIDI1NiB0
b28sIGp1c3Qgd2FudGVkIHRvIGJlIGV2aWwgYW5kIG5vdCBtYWtlIGl0IGEgcG93ZXIgb2YgMi4K
PiBKdXN0IGJ1bXAgdG8gMjU2IHRoZW4/IEVpdGhlciBmaXRzIGluIDE2Mzg0IGJ5dGVzLi4KPgo+
IH5NYWFydGVuCgpJdCdzIHRpbGVkLCBJIGd1ZXNzIGVpdGhlciB3YXkgc3RyaWRlIHdpbGwgYmUg
MTYzODQuIFNvIEkgcHVzaGVkIHdpdGggMjQ4IGFuZCBhbiBleHBsYW5hdGlvbiBpbiB0aGUgY29t
bWl0IG1lc3NhZ2Ugd2Ugcm91bmQgdG8gMTYzODQgYW55d2F5LgoKfk1hYXJ0ZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=

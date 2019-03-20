Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838C289FDD
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2019 15:44:38 +0000 (UTC)
References: <20190307024444.42432-1-nischala.yelchuri@intel.com>
 <20190313201635.20748-1-nischala.yelchuri@intel.com>
 <155250966026.30003.10001053991628825793@skylake-alporthouse-com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <65484c84-5bfc-276a-8eda-7f404b9a5387@linux.intel.com>
Date: Wed, 20 Mar 2019 16:44:36 +0100
MIME-Version: 1.0
In-Reply-To: <155250966026.30003.10001053991628825793@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH] tests/kms_cursor_legacy: Fix assertion
 failure due to vblank mismatch
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Nischala Yelchuri <nischala.yelchuri@intel.com>, igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMTMtMDMtMjAxOSBvbSAyMTo0MSBzY2hyZWVmIENocmlzIFdpbHNvbjoKPiBRdW90aW5nIE5p
c2NoYWxhIFllbGNodXJpICgyMDE5LTAzLTEzIDIwOjE2OjM1KQo+PiBGb3IgdGhlICFtb2Rlc2V0
IGNhc2UsIGFmdGVyIGEgcGFnZWZsaXAgaXMgcGVyZm9ybWVkIG9uIGJvdGggY3J0YydzLAo+PiB2
YmxhbmsgY291bnRlciBpcyBhZHZhbmNlZCBieSAxIHdoZW4gY29tcGFyZWQgdG8gaXRzIG9yaWdp
bmFsIHZhbHVlLgo+Pgo+PiBGb3IgdGhlIG1vZGVzZXQgY2FzZSwgd2hlbiBwYWdlZmxpcHMgYW5k
IG1vZGVzZXRzIGFyZSBpbnRlcmxlYXZlZCwKPj4gdmJsYW5rIGNvdW50ZXIgZG9lcyBub3QgYWx3
YXlzIGFkdmFuY2UgYnkgMSBhcyBub25ibG9ja2luZyBtb2Rlc2V0Cj4+IGNvdWxkIGZhaWwsIGlu
IHdoaWNoIGNhc2Ugd2UgZG8gbm90IG5lZWQgdmJsYW5rX21hdGNoZXMuCj4gSGF2aW5nIGFja25v
d2xlZGdlZCB0aGUgYnVnLCB0cnkgZml4aW5nIGl0Lgo+IC1DaHJpcwo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gaWd0LWRldiBtYWlsaW5nIGxpc3QK
PiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgoKSGV5LAoKTm90IHN1cmUgdGhhdCdzIHBv
c3NpYmxlLiBXZSBuZWVkIGFjY2VzcyB0byBhbGwgY3J0Y19zdGF0ZSdzIHdoZW4gcmVhbGxvY2F0
aW5nIGRkYiwgYW5kIHRoaXMgbWVhbnMgYSBwYWdlZmxpcCBvbiB0aGUgZmlyc3QgY3J0YyBpcyBz
dGFsbGVkIHdoaWxlIGRvaW5nIGEgbW9kZXNldCBvbiBhbm90aGVyLgoKVGhlIHBhZ2UgZmxpcCB3
aWxsIGJlIGJsb2NrZWQgb24gdGhlIG5vbmJsb2NraW5nIG1vZGVzZXQgdG8gY29tcGxldGUuCgp+
TWFhcnRlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

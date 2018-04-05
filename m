Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5654E6E42E
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Apr 2018 19:21:05 +0000 (UTC)
References: <20180227085232.54025-1-maarten.lankhorst@linux.intel.com>
 <20180227085232.54025-5-maarten.lankhorst@linux.intel.com>
 <c2d5541a-6dd5-b962-fe25-82a9898dd536@linux.intel.com>
 <1521661661.3150.13.camel@intel.com> <1522945862.2748.4.camel@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <1ec07ec3-8f39-bbf2-9a3d-02746040e9b9@linux.intel.com>
Date: Thu, 5 Apr 2018 21:21:02 +0200
MIME-Version: 1.0
In-Reply-To: <1522945862.2748.4.camel@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v3 4/4] tests/kms_frontbuffer_tracking:
 Remove redundant modesets during subtest start.
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
To: Paulo Zanoni <paulo.r.zanoni@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMDUtMDQtMTggb20gMTg6MzEgc2NocmVlZiBQYXVsbyBaYW5vbmk6Cj4gRW0gUXVhLCAyMDE4
LTAzLTIxIMOgcyAxMjo0NyAtMDcwMCwgUGF1bG8gWmFub25pIGVzY3JldmV1Ogo+PiBFbSBRdWks
IDIwMTgtMDMtMDEgw6BzIDE2OjMzICswMTAwLCBNYWFydGVuIExhbmtob3JzdCBlc2NyZXZldToK
Pj4+IEhleSwKPj4+Cj4+PiBPcCAyNy0wMi0xOCBvbSAwOTo1MiBzY2hyZWVmIE1hYXJ0ZW4gTGFu
a2hvcnN0Ogo+Pj4+IENSQyBjYXB0dXJpbmcgZW5hYmxlcyB0aGUgZGlzcGxheSwgdGhlbiBkaXNh
YmxlcyBpdCBhZ2Fpbi4gV2l0aAo+Pj4+IGlndF9kaXNwbGF5IHdlIGNhbiB1c2UgaWd0X2Rpc3Bs
YXlfcmVzZXQgdG8gcmVzdG9yZSB0aGUgb3JpZ2luYWwKPj4+PiBzdGF0ZSwKPj4+PiB3aXRob3V0
IGNvbW1pdHRpbmcgaXQgdG8gdGhlIGh3Lgo+Pj4+Cj4+Pj4gQWxsIHN1YnRlc3RzIGZpcnN0IHNl
dCB0aGVpciBvd24gc3RhdGUgYW55d2F5LCBzbyB3ZSBjYW4gc2F2ZSB1cAo+Pj4+IG9uCj4+Pj4g
dGhlIG51bWJlciBvZiBjb21taXRzLgo+Pj4gSSBwYXRjaGVkIGlndF9rbXMgdG8gcmVwb3J0IHRo
ZSBudW1iZXIgb2YgbW9kZXNldHMuLgo+Pj4KPj4+IFdpdGhvdXQgdGhpcyBwYXRjaCBydW5uaW5n
IC4va21zX2Zyb250YnVmZmVyX3RyYWNraW5nIG9uIGEgMiBvdXRwdXQKPj4+IHN5c3RlbSAoZjIt
c25iLTI2MDAsIGZvcmNlZCBWR0EtMSBlbmFibGVkKToKPj4+IFBlcmZvcm1lZCAzODIgbW9kZXNl
dHMKPj4+Cj4+PiBXaXRoIHRoaXMgcGF0Y2ggb24gYSAyIG91dHB1dCBzeXN0ZW06Cj4+PiBQZXJm
b3JtZWQgMjMgbW9kZXNldHMKPj4+Cj4+PiBPbiBnZW1pbmlsYWtlIHRoaXMgbWVhbnMgd2Ugc2F2
ZSBhIGxvdCBvZiB0aW1lLCBzbyBjb3VsZCBzb21lb25lCj4+PiByZXZpZXcgdGhpcyBzZXJpZXM/
Cj4+IElzIHRoZXJlIGFuIGFuYWx5c2lzIG9uIGhvdyByZWR1Y2luZyB0aGUgYW1vdW50IG9mIG1v
ZGVzZXRzIHdpbGwKPj4gKm5vdCoKPj4gaW52YWxpZGFkZSB0aGUgcHVycG9zZSBvZiB0aGUgdGVz
dHM/IFRoZSBtb2Rlc2V0cyBhcmUgdGhlcmUgZm9yIGEKPj4gcmVhc29uLgo+IFBpbmc/CkhvdyB3
aWxsIGRvaW5nIGEgbW9kZXNldCBpbXByb3ZlIHRoZSB0ZXN0PwoKV2UgcHJlc2VydmUgdGhlIG1v
ZGUgb25seSBpZiBpdCBtYWtlcyBzZW5zZSwgZWFjaCBzdWJ0ZXN0IHNldHMgdGhlIHBhcmFtZXRl
cnMgaXQgd2FudHMuIEl0IGp1c3QgaGFwcGVucyB0aGF0IGluIG1vc3QgY2FzZXMgdGhhdCdzIHRo
ZSBzYW1lIG1vZGUsIHNvIHdlIGRvbid0IGhhdmUgdG8gZG8gYSBtb2Rlc2V0LgpUaGF0J3MgYWxs
LiA6KQoKfk1hYXJ0ZW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

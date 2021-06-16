Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95096E51D
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jun 2021 08:07:27 +0000 (UTC)
References: <20210614164135.1519746-1-markyacoub@chromium.org>
 <20210615131254.5x5u2fjyy7p3uctf@outlook.office365.com>
 <e89fb09e-40c2-3b55-ae27-ed13c234bad7@amd.com>
 <CAJUqKUrDjKFf_yx9w=1TQViJr8C6QfPrYCsEqQO-1Nxou5eH9A@mail.gmail.com>
 <8f717975-4852-fb81-028a-e4c709b50014@amd.com>
 <CAJUqKUqVZb-GatjkGXChFYPXrYLCqwCe9Uu0epEASn8SMrzEfw@mail.gmail.com>
 <ae4be25c-c50d-56bb-6699-5ab6210f80bf@amd.com>
 <YMmpbOtT+CMFxbzI@platvala-desk.ger.corp.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8077ffe8-8ee5-1d58-1797-69848d11d27a@amd.com>
Date: Wed, 16 Jun 2021 10:07:18 +0200
In-Reply-To: <YMmpbOtT+CMFxbzI@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_prime: Filter out devices that
 can't import buffers.
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: Anson Jacob <Anson.Jacob@amd.com>, igt-dev@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

CgpBbSAxNi4wNi4yMSB1bSAwOTozNCBzY2hyaWViIFBldHJpIExhdHZhbGE6Cj4gT24gVHVlLCBK
dW4gMTUsIDIwMjEgYXQgMDY6MjA6MjNQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gVGhlIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRvIHRyeSB0byBjcmVhdGUgYSBmcmFtZWJ1ZmZl
ciwgYnV0IGRvbid0IHRha2UgaXQKPj4gYXMgYSBmYWlsdXJlIHdoZW4gdGhhdCBmYWlscyB3aXRo
IHRoZSBjb3JyZWN0IHJldHVybiBjb2RlLgo+IFRoaXMuCj4KPiBJZiB0aGUgaW1wb3J0aW5nIGNh
biBmYWlsIGZvciBkb2N1bWVudGVkIHJlYXNvbnMsIHdlIHNob3VsZCBqdXN0IGFkZAo+IGNvZGUg
dGhhdCBjaGVja3MgdGhhdCB0aGUgZXJyb3IgaXMgdGhlIGRvY3VtZW50ZWQgb25lIGFuZCB0aGVu
Cj4gaWd0X3NraXAoKSwgZmFpbCB0aGUgdGVzdCBpZiBpdCdzIHNvbWV0aGluZyBpdCBzaG91bGRu
J3QuCgpHb29kIHBvaW50LCBidXQgSSBkb24ndCB0aGluayB0aGF0IHRoaXMgYmVoYXZpb3IgaXMg
d2VsbCBkb2N1bWVudGVkIAphbnl3aGVyZS4KCkknbSBhbHNvIHByZXR0eSBzdXJlIHRoYXQgbW9z
dCBkcml2ZXJzIGRvbid0IGNvcnJlY3RseSByZWplY3QgYW4gCmltcG9ydGVkIERNQS1idWYgZm9y
IHNjYW5vdXQgd2hlbiB0aGUgaGFyZHdhcmUgY2FuJ3QgZG8gdGhpcy4gUmVzdWx0aW5nIAppbiBl
aXRoZXIganVzdCBnYXJiYWdlIG9uIHRoZSBzY3JlZW4gb3IgYSBsb2NrdXAuCgpFeGVyY2lzaW5n
IHRoaXMgaW4gYW4gdW5pdCB0ZXN0cyBpcyBwcm9iYWJseSBhIGdvb2QgaWRlYSwgYnV0IG9ubHkg
YWZ0ZXIgCmF1ZGl0aW5nIGFsbCBkcml2ZXJzIGZvciBjb3JyZWN0IGJlaGF2aW9yLgoKUmVnYXJk
cywKQ2hyaXN0aWFuLgoKPiBBcyBhIGdlbmVyYWwgcnVsZSB0aGUgdGVzdHMgZ29lcyB0byBoYXJk
d2FyZSBzcGVjaWZpYyBzdWJkaXJzIGlmIHRoZQo+IGludGVyZmFjZSB0ZXN0ZWQgaXMgaGFyZHdh
cmUtc3BlY2lmaWMuIFRoaXMgaW50ZXJmYWNlIGlzIG5vdCwganVzdCB0aGUKPiBiZWhhdmlvdXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK

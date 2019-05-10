Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EF089E15
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2019 15:57:14 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id m32so4104687qtf.0
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2019 08:57:14 -0700 (PDT)
Message-ID: <365fdfba703a6faf60ccca33699eac3678180696.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Fri, 10 May 2019 11:57:11 -0400
In-Reply-To: <20190510092235.GJ22949@platvala-desk.ger.corp.intel.com>
References: <20190510000604.3580-1-lyude@redhat.com>
 <20190510092235.GJ22949@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Use glib's regex utilities
 instead of POSIX ERE
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA1LTEwIGF0IDEyOjIyICswMzAwLCBQZXRyaSBMYXR2YWxhIHdyb3RlOgo+
IE9uIFRodSwgTWF5IDA5LCAyMDE5IGF0IDA4OjA2OjA0UE0gLTA0MDAsIEx5dWRlIHdyb3RlOgo+
ID4gRnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiA+IAo+ID4gUE9TSVggRVJF
LCB3aGlsZSBwcmV0dHkgc3RhbmRhcmQgaXMgYWxzbyB2ZXJ5IG9sZCBhbmQgc2V2ZXJlbHkgbGlt
aXRlZC4KPiA+IEluIGZhY3QsIGl0J3Mgc28gbGltaXRlZCB0aGF0IEludGVsIENJJ3Mgb3duIHRl
c3QgYmxhY2tsaXN0LAo+ID4gdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dCwgZG9lc24ndCBl
dmVuIHdvcmsgd2l0aCBpdCBkdWUgdG8gdGhlIGxhY2sKPiA+IG9mIHN1cHBvcnQgZm9yIGJhY2ty
ZWZlcmVuY2VzLgo+IAo+IFNpZGUgbm90ZTogRXZlbiB3aXRoIHRoZXNlIGNoYW5nZXMsIG5vdGhp
bmcgY2FuIGN1cnJlbnRseSBlYXQKPiBibGFja2xpc3QudHh0IGFzIGlzLiBTaXR0aW5nIHRpZ2h0
bHkgaW4gbXkgVE9ETyBpcyB0byBpbXBsZW1lbnQgdGhlCj4gZmluYWwgcGllY2Ugb2YgdGhlIHBp
cGVsaW5lIHRoYXQgQ0kgdXNlcyBwaWdsaXQgZm9yIHdpdGggaWd0X3J1bm5lciwKPiBzY3JpcHRz
L3J1bi10ZXN0cy5zaCAtbCwgd2l0aCBzb21ldGhpbmcgdGhhdCBjYW4gcHJvY2Vzcwo+IGJsYWNr
bGlzdC50eHQuIFRoZXNlIGNoYW5nZXMgYXJlIHRoZSBmaXJzdCBzdGVwIHRvd2FyZHMgdGhhdCwg
dGhhbmtzCj4gZm9yIGRvaW5nIHRoaXMuCj4gCj4gSW4gb3RoZXIgd29yZHMsIHRoaXMgZG9lc24n
dCBpbXBsZW1lbnQgd2hhdCBJIGd1ZXNzIHlvdSdyZSB0cnlpbmcgdG8KPiBkbyBidXQgaXQncyBu
ZWVkZWQsIHNvCnNpZGVub3RlOiBJIGhhdmUgYW4gYW5zaWJsZSBwbGF5Ym9vayBJIHVzZSBmb3Ig
cHJvY2Vzc2luZyB0aGUgYmxhY2tsaXN0IGFzCndlbGwsIHdoZW4gSSB3YXMgcmVmZXJyaW5nIHRv
IHRoZSBpbnRlbC1jaSBibGFja2xpc3QgSSB3YXMganVzdCByZWZlcnJpbmcgdG8KdGhlIGFjdHVh
bCBlbnRyaWVzIGluIGl0IC0gSSdtIGF3YXJlIHRoaXMgZG9lc24ndCBsZXQgeW91IHBhc3MgdGhl
IGJsYWNrbGlzdApkaXJlY3RseSB0byBpZ3QhIEJ1dCwgSSBmaWd1cmVkIGhhdmluZyBiZWhhdmlv
ciBsaWtlIHRoaXMgd291bGQgZW5hYmxlCnNvbWV0aGluZyBsaWtlIHlvdSdyZSB0cnlpbmcgdG8g
ZG8gYW5kIG1ha2UgdXMgbW9yZSBjb25zaXN0ZW50IHdpdGggcGlnbGl0CmFueXdheQoKQW55d2F5
LXRoYW5rcyBmb3IgdGhlIHJldmlldyEgd2lsbCBwdXNoIGluIGEgbW9tZW50Cgo+IAo+IFJldmll
d2VkLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KLS0gCkNoZWVy
cywKCUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==

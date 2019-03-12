Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6AF89F2A
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 16:22:10 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <cover.1552406927.git.neel.desai@intel.com>
In-Reply-To: <cover.1552406927.git.neel.desai@intel.com>
Message-ID: <155240771051.30003.10146753749050856630@skylake-alporthouse-com>
Date: Tue, 12 Mar 2019 16:21:55 +0000
Subject: Re: [igt-dev] [PATCH v2 0/1] Skip 2x-cursor-vs-flip subtests for
 gen > 9
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
To: Neel Desai <neel.desai@intel.com>, igt-dev@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, sudeep.dutt@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBOZWVsIERlc2FpICgyMDE5LTAzLTEyIDE2OjEyOjQzKQo+IFNraXAgdGhlIGZvbGxv
d2luZyBmb3IgZ2VuID4gOQo+IAo+IDEuKSB0ZXN0cy9rbXNfY3Vyc29yX2xlZ2FjeUAyeC1jdXJz
b3ItdnMtZmxpcC1hdG9taWMKPiAyLikgdGVzdHMva21zX2N1cnNvcl9sZWdhY3lAMngtY3Vyc29y
LXZzLWZsaXAtbGVnYWN5Cj4gMy4pIHRlc3RzL2ttc19jdXJzb3JfbGVnYWN5QDJ4LWxvbmctY3Vy
c29yLXZzLWZsaXAtYXRvbWljCj4gNC4pIHRlc3RzL2ttc19jdXJzb3JfbGVnYWN5QDJ4LWxvbmct
Y3Vyc29yLXZzLWZsaXAtbGVnYWN5Cj4gCj4gRHVlIHRvIEREQiBhbGxvY2F0aW9uIGNoYW5nZXMs
IHdlIGhhdmUgdG8gYWRkIGFsbCB0aGUgcGxhbmVzIHRvIHRoZQo+IGRybV9hdG9taWNfc3RhdGUg
cG9zdCBnZW4gOS4gV2hlbiB0aGUgd2F0ZXJtYXJrcyBhcmUgY29tcHV0ZWQgYnkgdGhlCj4ga2Vy
bmVsLCB0aGUgY3Vyc29yIHBsYW5lIGlzIGFkZGVkIHRvIHRoZSBkcm1fYXRvbWljX3N0YXRlIHdo
aWNoCj4gaW50cm9kdWNlcyBhIGRlcGVuZGVuY3kgb24gaHdfZG9uZSBvYmplY3Qgd2hlbiB0aGUg
a2VybmVsIHByb2Nlc3Nlcwo+IERSTV9JT0NUTF9NT0RFX0FUT01JQyBhbmQgRFJNX0lPQ1RMX01P
REVfQ1VSU09SIGluIHBhcmFsbGVsLiBUaGVyZSBpcyBubwo+IHJhY2UtZnJlZSB3YXkgdG8gaGFu
ZGxlIHRoaXMgY29ybmVyIGNhc2UuIFRoZXNlIHN1YnRlc3RzIG1hZGUgc2Vuc2UgZm9yCj4gb2xk
ZXIgZ2VuZXJhdGlvbnMgYnV0IG5vdCBhbnltb3JlLiBIZW5jZSwgc2tpcHBpbmcgdGhlc2Ugc3Vi
LXRlc3RzIHBvc3QKPiBnZW4gOS4KCk9yIGZhaWwuIE1hcmsgaXQgYXMgZXhwZWN0ZWQ7IGNvbWUg
YmFjayB3aGVuIHByb2JsZW0gaXMgc29sdmVkIG9yIEhXIGhhcwptb3ZlZCBvbi4KLUNocmlzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==

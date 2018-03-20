Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B32F6E862
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Mar 2018 19:57:43 +0000 (UTC)
References: <20180319223038.31024-1-antonio.argenziano@intel.com>
 <152154173123.3594.16893583802269871667@mail.alporthouse.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <66a4fac6-c008-4fc0-2ca1-081d54081b37@intel.com>
Date: Tue, 20 Mar 2018 12:57:42 -0700
MIME-Version: 1.0
In-Reply-To: <152154173123.3594.16893583802269871667@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] igt: Replace 'all-engines' magic
 numbers with macro
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAyMC8wMy8xOCAwMzoyOCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE4LTAzLTE5IDIyOjMwOjM4KQo+PiBJbiBpbnRlcmZhY2VzIHdoZXJl
IGEgcGFyYW1ldGVyIGFsbG93IHRvIHNlbGVjdCBhbiBlbmdpbmUsIHdlIHVzdWFsbHkKPj4gdXNl
ICctMScgb3IgJ34wdScgdG8gc2VsZWN0IGFsbCBlbmdpbmVzLiBUaGlzIHBhdGNoIHJlcGxhY2Vz
IG1hZ2ljCj4+IG51bWJlcnMgd2l0aCBhIG5hbWVkIGNvbnN0YW50Lgo+Pgo+PiBTdWdnZXN0ZWQt
Ynk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+PiBTaWduZWQtb2Zm
LWJ5OiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRlbC5jb20+Cj4+
Cj4+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBSZXZpZXdl
ZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gCj4gUXVpY2sg
YmVmb3JlIEkgYWRkIG1vcmUgLTEuCgpQdXNoZWQgOykuIFRoYW5rcyBmb3IgdGhlIHJldmlldy4K
CkFudG9uaW8KCj4gLUNocmlzCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=

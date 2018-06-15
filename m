Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9786EB11
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jun 2018 11:00:13 +0000 (UTC)
MIME-Version: 1.0
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
In-Reply-To: <20180502092807.28266-1-chris@chris-wilson.co.uk>
References: <20180502092807.28266-1-chris@chris-wilson.co.uk>
Message-ID: <152906041105.7952.2191979154027542088@jlahtine-desk.ger.corp.intel.com>
Date: Fri, 15 Jun 2018 14:00:11 +0300
Subject: Re: [igt-dev] [PATCH i-g-t] igt/sw_sync: Wrap threaded counter
 manipulation with mb
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

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTgtMDUtMDIgMTI6Mjg6MDcpCj4gc3dfc3luYy9zeW5j
X211bHRpX2NvbnN1bWVyX3Byb2R1Y2VyIHdhcyBjb21tdW5pY2F0aW5nIGJldHdlZW4gdGhyZWFk
cwo+IHVzaW5nIHRoZSBzd19zeW5jIGlvY3RsIGFuZCBtYW5pcHVsYXRpbmcgYSBzaGFyZWQgdm9s
YXRpbGUgY291bnRlci4KPiBIb3dldmVyLCB0aGUgaW9jdGwgaXRzZWxmIGRvZXMgbm90IGltcGx5
IGEgbWVtb3J5IGJhcnJpZXIsIGFuZCBzbwo+IGRpZmZlcmVudCBDUFVzIG1heSBzZWUgZGlmZmVy
ZW50IHN0YXRlcyBvZiB0aGUgY291bnRlciAodGhlIHZvbGF0aWxlCj4gbWFraW5nIEdDQyBwZXJm
b3JtIHRoZSBvcGVyYXRpb24gaW4gc3RhZ2VzIG1ha2luZyB0aGUgcmFjZSBldmVuIG1vcmUKPiBs
aWtlbHkpLiBJbnN0ZWFkIG9mIHVzaW5nIHZvbGF0aWxlLCB1c2UgbG9ja2VkIG9wZXJhdGlvbnMg
dG8gbWFrZSB0aGUKPiBjb3VudGVyIG1hbmlwdWxhdGlvbiB0aHJlYWQtc2FmZS4KPiAKPiBSZWZl
cmVuY2VzOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDYz
NDQKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51
az4KClNvcnJ5LCB0aGlzIGhhcyBnb3QgYnVyaWVkIGFsb25nIHdpdGggdGhlIHByb2JhYmx5IHRo
b3VzYW5kIG90aGVyCnBhdGNoZXMuCgpSZXZpZXdlZC1ieTogSm9vbmFzIExhaHRpbmVuIDxqb29u
YXMubGFodGluZW5AbGludXguaW50ZWwuY29tPgoKUmVnYXJkcywgSm9vbmFzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=

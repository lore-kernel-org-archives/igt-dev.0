Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90B389E06
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2019 17:22:29 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <ebc791267be5d25674767591abe0830df7027b9d.1551830533.git.caz.yokoyama@intel.com>
In-Reply-To: <ebc791267be5d25674767591abe0830df7027b9d.1551830533.git.caz.yokoyama@intel.com>
Message-ID: <155180654478.27405.14279936406391255294@skylake-alporthouse-com>
Date: Tue, 05 Mar 2019 17:22:25 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] i915_pm_rpm:
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
To: Caz Yokoyama <caz.yokoyama@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDYXogWW9rb3lhbWEgKDIwMTktMDMtMDYgMDA6MDY6NTUpCj4gTGVzcyBpdGVyYXRl
IGJlY2F1c2UgV0FJVF9FWFRSQSBhZGRzIGV4dHJhIDUgc2VjIGRlbGF5IGZvciBlYWNoIGl0ZXJh
dGlvbi4KPiBUaGlzIHRlc3QgaXMgc2ltaWxhciB0byBnZW0tZXhlY2J1Zi1zdHJlc3MgZXhjZXB0
IGZvciBXQUlUX0VYVFJBLgo+IEl0IHJ1bnMgODYgc2VjLiB3aGlsZSBnZW0tZXhlY2J1Zi1zdHJl
c3MgcnVucyAzOCBzZWMuCj4gaS5lLiAzOHMgKyBpdGVyYXRpb24ocm91bmRzLDEwKSAqIDVzID0g
ODhzCgpXaHkgZG9lcyBpdCB3YWl0IGZvciA1cz8gVGhlcmUncyBubyBzZWNvbmQgc3RhZ2UgdG8g
cnVudGltZSBzdXNwZW5kLCBidXQKaWYgdGhlcmUgd2FzLCBhZGQgYSBkZWJ1ZyBpbnRlcmZhY2Ug
dG8gZm9yY2UgaXQuCgpTb21ldGhpbmcgZWxzZSB0aGF0IGNhbiBiZSBlbXBsb3llZCB0byBzcGVl
ZCB1cCB0aGlzIHRlc3Qgd291bGQgYmUKaWd0X2Ryb3BfY2FjaGVzX3NldChEUk9QX0lETEUpIChi
ZWZvcmUgd2FpdGluZyBmb3IgcnVudGltZSBzdXNwZW5kKS4KLUNocmlzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==

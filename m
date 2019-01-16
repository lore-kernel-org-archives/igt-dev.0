Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163CD6EEA4
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 00:22:33 +0000 (UTC)
From: Deepak Rawat <drawat@vmware.com>
Date: Tue, 15 Jan 2019 16:22:27 -0800
Message-ID: <20190116002230.2545-1-drawat@vmware.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/3] Fixes to kms_addfb_basic + RFC IGT buf
 alloc
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
To: thellstrom@vmware.com, igt-dev@lists.freedesktop.org
Cc: Deepak Rawat <drawat@vmware.com>, linux-graphics-maintainer@vmware.com
List-ID: <igt-dev@lists.freedesktop.org>

SGksCgpTZW5kaW5nIGEgZmV3IGZpeGVzIHRvIGttc19hZGRmYl9iYXNpYyB3aGljaCBhcmUgbWFp
bmx5IGZvciB2bXdnZnggdG8KcnVuIHdpdGhvdXQgZXJyb3IuIFRoZXNlIGFyZSByZWFsbHkgc2hv
cnRzaWdodGVkIGZpeCBhbmQgd2l0aCB0aGlzIEkKd291bGQgbGlrZSB0byBnZXQgZmVlZGJhY2sg
ZnJvbSBjb21tdW5pdHkgcmVnYXJkaW5nIEJPIGFsbG9jYXRpb24gZm9yCmRyaXZlcnMgbGlrZSB2
bXdnZnggd2hpY2ggaGF2ZSBwcml2YXRlIElPQ1RMIGZvciBhbGxvY2F0aW9uLiBNeSBlbmQKZ29h
bCBpcyB0byBhZGQgdm13Z2Z4IEJPIHN1cHBvcnQgd2hpY2ggY3JlYXRpbmcgaWd0X2ZiLgoKQ3Vy
cmVudGx5IGlndF9mYiBpcyBzb21ld2hhdCB0aWVkIHRvIGhhbmRsZS4gSSBkaWRuJ3QgbG9va2Vk
IGludG8gbXVjaApkZXRhaWwgYnV0IG15IGZpc3QgdGhvdWdodCB3YXMgdG8gc2VwYXJhdGUgb3V0
IGhhbmRsZSwgaXNfZHVtYiwgZXRjIGZyb20KaWd0X2ZiIGFuZCBoYXZlIGEgc2VwYXJhdGUgc3Ry
dWN0IGZvciBCTy4gU2ltaWxhcmx5IGRpc3RpbmN0IEFQSSBmb3IgQk8KY3JlYXRlL2Rlc3Ryb3ku
IE9yIGlzIHRoaXMgdW5uZWNlc3NhcnkgYW5kIHNpbXBseSBhZGRpbmcgYSBuZXcgQVBJCmlndF9k
ZXN0cm95X2JvIHNob3VsZCBiZSBlbm91Z2ggdG8gc29sdmUgcHJvYmxlbXMgd2hlcmUKaWd0X2Ny
ZWF0ZV9ib193aXRoX2RpbWVuc2lvbnMoKSB3YXMgdXNlZC4KCkkgd291bGQgbGlrZSB0byBrbm93
IGlmIGFueW9uZSBlbHNlIGxvb2tlZCBpbnRvIHRoaXMgb3IgaXQncyBpbiB0aGVpciBUT0RPCmxp
c3QuCgpUaGFua3MsCkRlZXBhawoKRGVlcGFrIFJhd2F0ICgzKToKICBpZ3Qva21zX2FkZGZiX2Jh
c2ljOiBDYWxsIGR1bWIgZGVzdHJveSBpbiBjYXNlIGhhdmUgZHVtYiBidWZmZXIKICBpZ3Qva21z
X2FkZGZiX2Jhc2ljOiBDYWxsIGlndF9yZXF1aXJlX2dlbSBmb3IgZ2VtIHNwZWNpZmljIHRpbGlu
ZwogIGlndC9rbXNfYWRkZmJfYmFzaWM6IEFkZCBtaXNzaW5nIGNhbGxzIHRvIGdlbV9jbG9zZQoK
IHRlc3RzL2ttc19hZGRmYl9iYXNpYy5jIHwgOTEgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspLCAyMCBkZWxl
dGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=

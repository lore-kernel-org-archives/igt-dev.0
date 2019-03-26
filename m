Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB446E03B
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2019 13:03:19 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue, 26 Mar 2019 18:29:22 +0530
Message-Id: <1553605164-11071-1-git-send-email-anshuman.gupta@intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/2] Enabling PC8+ residency for all GEN9+
 platforms v2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXJpZXMgZW5hYmxlIFBDOCsgcmVzaWRlbmN5IHRlc3QsIGVhcmxpZXIgdGhl
c2UgdGVzdHMKd2VyZSBvbmx5IGVuYWJsZWQgZm9yIEhhc3dlbGwgYW5kIEJyb2Fkd2VsbC4KCkkg
aGF2ZSBhZGRyZXNzZWQgdGhlIGJlbG93IHJldmlldyBjb21tZW50IGZyb20gb2xkIHNlcmllcyAo
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81NzAzNS8pCgoxLiBNYWRl
IHRoaXMgdGVzdCBmdXR1cmUgcHJvb2YgdG8gZW5hYmxlIGZvciBhbGwgR2VuOSsgcGxhdGZvcm0u
CjIuIEFkZGVkIGEgcGM4X25lZWRzX3NjcmVlbl9vZmYgZmxhZyB0byBkaXN0aW5ndWlzaCBiZXR3
ZWVuIEhTVy9CRFcgYW5kIEdlbjkrCiAgIFBsYXRmb3JtLgozLiBTaW5jZSBHZW45IG9ud2FyZHMg
UEM4KyByZXNpZGVuY3kgZG9lc24ndCByZXF1aXJlIGRpc3BsYXkgdG8gYmUgdHVybmVkIG9mZiwK
ICAgdGhpcyBwYXRjaCBzZXJpZXMgdGVzdHMgUEM4IHJlc2lkZW5jeSB3aXRoIGFsbCBzY3JlZW5z
IG9uLgoKVGVzdGVkIG9uIEdlbjkgS0JMIFBsYXRmb3JtLCB1bmFibGUgdG8gdGVzdCBvbiBJQ0ws
IGJlY2F1c2UgSUNMIHN5c3RlbXMgYXQgbG9jYWwKQkEgc2V0dXAgYXJlIG5vdCBlbnRlcmluZyB0
byBQQzIgaXRzZWxmLgoKUGxhbm5pbmcgYSBzZXBhcmF0ZSBzZXJpZXMgZm9yIGEgc3VidGVzdCB0
byB2YWxpZGF0ZSBwYzggd2l0aCBtdWx0aXBsZSBwaXBlcwp1c2FnZXMgYW5kIGFsbCBwbGFuZXMg
ZW5hYmxlZCB3aXRoIG1heCByZXNvbHV0aW9uLCB0byBjcmVhdGUgbWF4aW11bSBtZW1vcnkKYmFu
ZHdpZHRoIHNjZW5hcmlvLgoKQW5zaHVtYW4gR3VwdGEgKDIpOgogIHRlc3RzL2k5MTUvaTkxNV9w
bV9ycG06IEVuYWJsZSBQQzgrIHJlc2lkZW5jeSB0ZXN0IGZvciBhbGwgR2VuOSsKICB0ZXN0cy9p
OTE1L2k5MTVfcG1fcnBtOiBtb2Rlc2V0LXBjOC1yZXNpZGVuY3ktc3RyZXNzCgogdGVzdHMvaTkx
NS9pOTE1X3BtX3JwbS5jIHwgNzcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

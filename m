Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed,  2 Oct 2019 12:19:43 +0100
Message-Id: <20191002111943.12227-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_eio: Relax timeout for forced
 resets
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SXQgYXBwZWFycyB3ZSBjYW5ub3QgY29uc2lzdGVudGx5IGhpdCBvdXIgc2VsZi1pbXBvc2VkIFFv
UyB0YXJnZXQgb2YgMnMKZm9yIHBlcmZvcm1pbmcgdGhlIHJlc2V0IChteSB0aGVvcnkgaXMgdGhh
dCBpcyBzb21lIFJDVSBzY2hlZHVsaW5nCnF1aXJrKSwgc28gcmVsYXggdGhlIGFzc2VydGlvbiB0
byBhIG1lYXNseSAxMHMuCgpCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9z
aG93X2J1Zy5jZ2k/aWQ9MTA1OTU3ClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL2k5MTUvZ2VtX2Vpby5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
dGVzdHMvaTkxNS9nZW1fZWlvLmMgYi90ZXN0cy9pOTE1L2dlbV9laW8uYwppbmRleCA3YWRiNTQ2
N2YuLjAwN2I5ZmI3MCAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1fZWlvLmMKKysrIGIvdGVz
dHMvaTkxNS9nZW1fZWlvLmMKQEAgLTgyLDcgKzgyLDcgQEAgc3RhdGljIHZvaWQgdHJpZ2dlcl9y
ZXNldChpbnQgZmQpCiAJaWd0X2Ryb3BfY2FjaGVzX3NldChmZCwgRFJPUF9BQ1RJVkUpOwogCiAJ
LyogV2UgZXhwZWN0IGZvcmNlZCByZXNldCBhbmQgaGVhbHRoIGNoZWNrIHRvIGJlIHF1aWNrLiAq
LwotCWlndF9hc3NlcnQoaWd0X3NlY29uZHNfZWxhcHNlZCgmdHMpIDwgMik7CisJaWd0X2Fzc2Vy
dF9sdGUoaWd0X3NlY29uZHNfZWxhcHNlZCgmdHMpLCAxMCk7CiB9CiAKIHN0YXRpYyB2b2lkIG1h
bnVhbF9oYW5nKGludCBkcm1fZmQpCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldg==

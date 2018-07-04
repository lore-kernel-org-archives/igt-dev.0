Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed,  4 Jul 2018 13:38:23 +0100
Message-Id: <20180704123823.3271-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] [PATCH i-g-t] amdgpu/amd_prime: Reduce setup time
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SWYgd2UgYWxsb3cgNXMgKCsyMCUgc3lzdGVtYXRpYyBlcnJvcikgdG8gY29uc3RydWN0IHRoZSBm
ZW5jZXMsIHdlIG1heQpyZWFzb25hYmx5IGFzc3VtZSB0aGF0IGl0IHdpbGwgdGFrZSBlcXVhbGx5
IGFzIGxvbmcgdG8gY29uc3VtZSB0aGVtLiBBcwp3ZSBvbmx5IGhhdmUgMTBzIGJlZm9yZSB0aGUg
dmdlbSBmZW5jZSB0aW1lcyBvdXQsIHRoZXJlIGlzIG5vIG1hcmdpbiBvZgpzYWZldHkuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0tCiB0
ZXN0cy9hbWRncHUvYW1kX3ByaW1lLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9hbWRncHUvYW1kX3ByaW1l
LmMgYi90ZXN0cy9hbWRncHUvYW1kX3ByaW1lLmMKaW5kZXggYmI2OGNjZjMxLi42YzY0YzNhZjkg
MTAwNjQ0Ci0tLSBhL3Rlc3RzL2FtZGdwdS9hbWRfcHJpbWUuYworKysgYi90ZXN0cy9hbWRncHUv
YW1kX3ByaW1lLmMKQEAgLTM0OCw3ICszNDgsNyBAQCBzdGF0aWMgdm9pZCBhbWRfdG9faTkxNShp
bnQgaTkxNSwgaW50IGFtZCwgYW1kZ3B1X2RldmljZV9oYW5kbGUgZGV2aWNlKQogCWNvdW50ID0g
MDsKIAlzaXplID0gNjQgPDwgMTA7CiAJY29udGV4dHMgPSBtYWxsb2Moc2l6ZSAqIHNpemVvZigq
Y29udGV4dHMpKTsKLQlpZ3RfdW50aWxfdGltZW91dCg1KSB7CisJaWd0X3VudGlsX3RpbWVvdXQo
MikgewogCQlpZiAoY291bnQgPT0gc2l6ZSkgewogCQkJc2l6ZSAqPSAyOwogCQkJY29udGV4dHMg
PSByZWFsbG9jKGNvbnRleHRzLCBzaXplICogc2l6ZW9mKCpjb250ZXh0cykpOwotLSAKMi4xOC4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1n
ZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK

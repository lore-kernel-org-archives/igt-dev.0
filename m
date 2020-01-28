Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DB26EDDB
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2020 11:26:11 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id t23so2111944wmi.1
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2020 03:26:11 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 28 Jan 2020 12:25:49 +0100
Message-Id: <20200128112549.172135-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20200128112549.172135-1-daniel.vetter@ffwll.ch>
References: <20200128112549.172135-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/kms_fbcon_fbt: Drop master before
 restoring fbcon
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

ZmJkZXYgaGVscGVycyByZWZ1c2UgdG8gcmVzdG9yZSB0aGUgZmJkZXYgc2NyZWVuIGlmIHRoZXJl
J3Mgc3RpbGwgYQptYXN0ZXIgcHJlc2VudC4gVGhpcyBpcyB0byBhdm9pZCBmYmNvbiBwb3BwaW5n
IHVwIHdoZW4gYSBjb21wb3NpdG9yCmhhcyBpbnRlbnRpb25hbGx5IGRpc2FibGVkIGFsbCBvdXRw
dXRzLgoKVW5mb3J0dW5hdGVseSB0aGUga2VybmVsIGhhZCBzb21lIGJ1Z3MgaW4gdGhpcyBhcmVh
LCBhbmQga21zX2ZiY29uX2ZidApyZWxpZWQgb24gdGhvc2UuIFJlc3VsdCB3YXMgdGhhdCBmYmRl
diByZXN0b3JlIHdhcyBza2lwcGVkLCB3aGljaApza2lwcGVkIHRoZSBmcm9udGJ1ZmZlciBmbHVz
aGluZywgd2hpY2ggYnJva2UgdGhlIFBTUiBzdWJ0ZXN0J3MKZXhwZWN0YXRpb24gdGhhdCBQU1Ig
aXMgYWx3YXlzIGRpc2FibGUgd2hlbiBmYmRldiBpcyBlbmFibGVkLiBGQkMgZGlkCm5vdCBnZXQg
YnJva2VuIGJlY2F1c2UgRkJDIHdhcyBuZXZlciBlbmFibGVkIG9uIGxpbmVhciBmcmFtZWJ1ZmZl
cnMgYXMKdXNlZCBieSBmYmRldi4KCkZpeCB0aGluZ3MgdXAgdG8gbWFrZSBzdXJlIGZiY29uIGdl
dHMgcmVzdG9yZWQgY29ycmVjdGx5IGluIGFsbCBjYXNlcy4KCkNjOiBOb3JhbGYgVHLDuG5uZXMg
PG5vcmFsZkB0cm9ubmVzLm9yZz4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2ZiY29uX2ZidC5jIHwgMiArKwogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mYmNv
bl9mYnQuYyBiL3Rlc3RzL2ttc19mYmNvbl9mYnQuYwppbmRleCAyMzZlMDllYTFlYmQuLmVkNGNj
Y2JlNzQzZSAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2ZiY29uX2ZidC5jCisrKyBiL3Rlc3RzL2tt
c19mYmNvbl9mYnQuYwpAQCAtNzQsNiArNzQsOCBAQCBzdGF0aWMgdm9pZCB0ZWFyZG93bl9kcm0o
c3RydWN0IGRybV9pbmZvICpkcm0pCiB7CiAJaW50IGk7CiAKKwlpZ3RfYXNzZXJ0X2VxKGRybURy
b3BNYXN0ZXIoZHJtLT5mZCksIDApOworCiAJa21zdGVzdF9yZXN0b3JlX3Z0X21vZGUoKTsKIAog
CWZvciAoaSA9IDA7IGkgPCBkcm0tPnJlcy0+Y291bnRfY29ubmVjdG9yczsgaSsrKQotLSAKMi4y
NC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK

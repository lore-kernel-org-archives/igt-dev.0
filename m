Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B773891DD
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2019 11:11:07 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue,  9 Apr 2019 13:10:57 +0200
Message-Id: <20190409111059.25296-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v5 0/2] Add a new test for driver/device hot reload
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
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Petri Latvala <petri.latvala@intel.com>, "Lee,
 Simon B" <simon.b.lee@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SmFudXN6IEtyenlzenRvZmlrICgyKToKICB0ZXN0czogQWRkIGEgbmV3IHRlc3QgZm9yIGRyaXZl
ci9kZXZpY2UgaG90IHJlbG9hZAogIHRlc3RzL2NvcmVfaG90X3JlbG9hZDogQWNjZXB0IGV4dGVy
bmFsIHdvcmtsb2FkCgogdGVzdHMvTWFrZWZpbGUuc291cmNlcyAgfCAgIDEgKwogdGVzdHMvY29y
ZV9ob3RfcmVsb2FkLmMgfCAzMDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwogdGVzdHMvbWVzb24uYnVpbGQgICAgICAgfCAgIDEgKwogMyBmaWxlcyBjaGFuZ2VkLCAz
MDUgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2NvcmVfaG90X3JlbG9h
ZC5jCgoKQ2hhbmdlbG9nOgp2NC0+djU6Ci0gbW92ZSB3b3JrbG9hZCBiYWNrIGZyb20gc3VidGVz
dHMgdG8gaW5pdGlhbCBmaXh0dXJlIGFuZCBydW4gaXQgZnJvbQogIGFuIGlndCBoZWxwZXIgc3Vi
cHJvY2VzcyBzbyB3b3JrbG9hZCBjcmFzaCBkb2VzIG5vdCBhZmZlY3QgdGVzdAogIHJlc3VsdHMg
YW5kIHJlc291cmNlcyBjb25zdW1lZCBieSB0aGUgd29ya2xvYWQgYXJlIGNsZWFuZWQgdXAKICBh
dXRvbWF0aWNhbGx5LCBhbHNvIHdpdGhvdXQgYWZmZWN0aW5nIHRlc3QgcmVzdWx0cywKLSByZS1h
ZGQgdGhlIHNlY29uZCBwYXRjaCB3aGljaCBleHRlbmRzIHRoZSB0ZXN0IHdpdGggYW4gb3B0aW9u
IGZvcgogIHVzaW5nIGFuIGV4dGVybmFsIGNvbW1hbmQgYXMgYSB3b3JrbG9hZC4KCnYzLT52NCAo
Zmlyc3QgcHVibGljIHN1Ym1pc3Npb24pOgotIHJ1biBkdW1teV93b3Jrb2xhZCBmcm9tIGluc2lk
ZSBzdWJ0ZXN0cywKLSB0cnkgdG8gcmVzdG9yZSB0aGUgZGV2aWNlIHRvIGEgd29ya2luZyBzdGF0
ZSBhZnRlciBlYWNoIHN1YnRlc3QuCgp2Mi0+djM6Ci0gcnVuIGR1bW15X3dvcmtsb2FkIGZyb20g
dGhlIHRlc3QgcHJvY2VzcyBkaXJlY3RseSwKLSBkcm9wIHRoZSBwYXRjaCBmb3IgcnVubmluZyBl
eHRlcm5hbCB3b3JrbG9hZC4KCnYxLT52MjoKLSBydW4gYSBzdWJwcm9jZXNzIHdpdGggZHVtbXlf
d29ya2xvYWQgaW5zdGVhZCBvZiBleHRlcm5hbCBjb21tYW5kLAotIGtlZXAgdXNlIG9mIGV4dGVy
bmFsIHdvcmtsb2FkIGNvbW1hbmQgYXMgYW4gb3B0aW9uLCBtb3ZlIHRoYXQgdG8gYQogIHNlcGFy
YXRlIHBhdGNoLgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXY=

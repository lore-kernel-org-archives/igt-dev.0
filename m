Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2723E88A3E
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2019 23:26:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C509B369C4
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2019 23:26:02 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Tue, 16 Apr 2019 19:25:48 -0400
Message-Id: <20190416232548.13755-9-lyude@redhat.com>
In-Reply-To: <20190416232548.13755-1-lyude@redhat.com>
References: <20190416232548.13755-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 8/8] Gitlab CI: Do builds with
 -Db_ndebug=true
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KClRvIG1ha2Ugc3VyZSB0aGF0IG5v
IG9uZSBldmVyIHVzZXMgYXNzZXJ0KCkgaW4gdGhlIHdyb25nIHBsYWNlcyBhZ2FpbiwKbGV0J3Mg
YnVpbGQgd2l0aCAtRGJfbmRlYnVnPXRydWUgc28gdGhhdCBhc3NlcnQoKSBnZXRzIGNvbXBpbGVk
IG91dC4KClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQog
LmdpdGxhYi1jaS55bWwgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhLy5naXRsYWItY2kueW1sIGIvLmdpdGxhYi1jaS55bWwKaW5kZXggYWU4Y2JiNjcu
LjBjYzEzNGFlIDEwMDY0NAotLS0gYS8uZ2l0bGFiLWNpLnltbAorKysgYi8uZ2l0bGFiLWNpLnlt
bApAQCAtMTAsNiArMTAsNyBAQCB2YXJpYWJsZXM6CiAgICAgLURidWlsZF90ZXN0cz10cnVlCiAg
ICAgLURidWlsZF9ydW5uZXI9dHJ1ZQogICAgIC1Ed2l0aF9saWJ1bndpbmQ9dHJ1ZQorICAgIC1E
Yl9uZGVidWc9dHJ1ZQogICBMQU5HOiAiQy5VVEYtOCIKIAogc3RhZ2VzOgotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=

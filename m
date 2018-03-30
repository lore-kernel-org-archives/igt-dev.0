Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A086E0CF
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Mar 2018 18:27:07 +0000 (UTC)
Received: from [IPv6:2a01:4c8:1029:fae7:6899:eca6:e826:8d61] (unknown
 [IPv6:2a01:4c8:1029:fae7:6899:eca6:e826:8d61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: daniels)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6E87F2655B5
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Mar 2018 19:20:51 +0100 (BST)
Date: Fri, 30 Mar 2018 19:20:43 +0100
Message-ID: <a0767b5a-5bba-4136-91d5-03124c6dd671@email.android.com>
In-Reply-To: <20180330174757.575.692@emeril.freedesktop.org>
From: Daniel Stone <daniels@collabora.com>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogd2FybmluZyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fgetfb=3A_Use_fixtures_and_subtest_groups?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1423259204=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1423259204==
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9J2F1dG8nPjxkaXY+SGksPGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+
PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIDMwIE1hciAyMDE4IDY6NDcgcG0sIFBhdGNod29y
ayAmbHQ7cGF0Y2h3b3JrQGVtZXJpbC5mcmVlZGVza3RvcC5vcmcmZ3Q7IHdyb3RlOjxibG9ja3F1
b3RlIGNsYXNzPSJxdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFw
eCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjxwIGRpcj0ibHRyIj4KCjxicj4KLS0tLSBQ
b3NzaWJsZSBuZXcgaXNzdWVzOgo8YnI+Cgo8YnI+ClRlc3Qga21zX2F0b21pY190cmFuc2l0aW9u
Ogo8YnI+CiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBTdWJncm91
cCAxeC1tb2Rlc2V0LXRyYW5zaXRpb25zLWZlbmNpbmc6Cjxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7IHBhc3MmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsg
LSZndDsgU0tJUCZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAoc2hhcmQtc25i
KQo8YnI+ClRlc3Qga21zX2Zyb250YnVmZmVyX3RyYWNraW5nOgo8YnI+CiZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBTdWJncm91cCBmYmMtMXAtb2Zmc2NyZW4tcHJp
LWluZGZiLWRyYXctYmx0Ogo8YnI+CiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBw
YXNzJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IC0mZ3Q7IFNLSVAmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgKHNoYXJkLXNuYikKPGJyPgoKPC9wPjwvYmxv
Y2txdW90ZT48L2Rpdj48L2Rpdj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYg
ZGlyPSJhdXRvIj5DZXJ0YWlubHkgc2VlbXMgdW5yZWxhdGVkOyBpcyBzaGFyZC1zbmIgdW5oZWFs
dGh5PzwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPkNoZWVy
cyw8L2Rpdj48ZGl2IGRpcj0iYXV0byI+RGFuaWVsICh3aXRoIGFwb2xvZ2llcyBmb3IgbW9iaWxl
IGVtYWlsIGNsaWVudCBmb3JtYXR0aW5nKTwvZGl2PjwvZGl2Pg==


--===============1423259204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1423259204==--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F686E23C
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jan 2018 15:14:39 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180126150302.12337-1-lukasz.kalamarz@intel.com>
In-Reply-To: <20180126150302.12337-1-lukasz.kalamarz@intel.com>
Message-ID: <151697967468.674.10136288566334785019@mail.alporthouse.com>
Date: Fri, 26 Jan 2018 15:14:34 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] gem_gpu_fill: Merging gem_gpgpu_fill
 and gem_media_fill into one
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
To: Lukasz Kalamarz <lukasz.kalamarz@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBMdWthc3ogS2FsYW1hcnogKDIwMTgtMDEtMjYgMTU6MDM6MDIpCj4gSW1wbGVtZW50
YXRpb24gb2YgdGhvc2UgdGVzdCBvbmx5IGRpZmZlciB3aXRoIGZpbGxfZnVuY3Rpb24gdXNlZCBi
eQo+IGVpdGhlciBtZWRpYSBvciBncGdwdSBwaXBlbGluZSwgd2hpY2ggc2hhcmVkIHNhbWUgdHlw
ZS4gUmF0aGVyIHRoYW4KPiBoYXZpbmcgdHdvIHRlc3RzLCB3aGljaCBhcmUgaW4gOTglIGNvcHkt
cGFzdGUgaXQgaXMgZWFzaWVyIHRvCj4gbWFpbnRhaW4gb25lIHdpdGggc2FtZSBmdW5jdGlvbmFs
aXR5LgoKSSBoZWFyIHRoZXJlJ3MgYSByZW5kZXIgZXF1aXZhbGVudCBhcyB3ZWxsLgpJIHByZXN1
bWUgZWFjaCByb3V0aW5lIGlzIHJ1biBvdmVyIGFsbCBlbmdpbmVzIHRoYXQgc3VwcG9ydCBpdD8K
LUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=

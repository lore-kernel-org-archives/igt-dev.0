Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C19789BBE
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Nov 2021 22:16:29 +0000 (UTC)
Date: Tue, 09 Nov 2021 22:16:25 +0000
From: Simon Ser <contact@emersion.fr>
Message-ID: <j9ATssWsNa_3rHgW5tZwsfuBva61xhhN3WdTP5hdEhzJQb6CU0MAm534ns0P7Gvi-099Q37QPyNlDUtihQmGsjEhB-UHty1d4IWpSGJCpoo=@emersion.fr>
In-Reply-To: <5abc06ee-c974-d924-3687-59a02427b77f@amd.com>
References: <20211104162742.174363-1-contact@emersion.fr>
 <5abc06ee-c974-d924-3687-59a02427b77f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH] tests/kms_plane_alpha_blend: skip coverage
 tests on missing enum
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Harry Wentland <harry.wentland@amd.com>
Cc: igt-dev@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tuesday, November 9th, 2021 at 19:14, Harry Wentland <harry.wentland@amd=
.com> wrote:

> On 2021-11-04 12:27, Simon Ser wrote:
> > Some KMS drivers support the KMS "pixel blend mode" plane property,
> > but don't support the "Coverage" mode. This enum entry is missing
> > to indicate lack of support as seen in this drm_info exerpt:
> >
> >     "pixel blend mode": enum {None, Pre-multiplied} =3D Pre-multiplied
> >
> > Skip the coverage tests in this case.
>
> Is "coverage" interesting for compositors? We have the ability to do
> pre-multiplied or coverage in HW but it's not hooked up currently.

I _think_ it'll be useful with the WIP color management Wayland protocol,
because clients will be able to submit straight (non-premult) buffers?

CC Pekka

(In any case, it's good to have the skip since it's not AMD-specific.)

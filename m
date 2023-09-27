Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F04210E58D
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 16:53:15 +0000 (UTC)
Date: Wed, 27 Sep 2023 18:53:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230927165310.wdly6fmynbzaaynt@kamilkon-desk.igk.intel.com>
References: <20230925162212.125997-1-robdclark@gmail.com>
 <CAPj87rOT3wuVpb3t2Ax_YvAMnmtL_xfzGKrdvzBar_QyHqyexw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPj87rOT3wuVpb3t2Ax_YvAMnmtL_xfzGKrdvzBar_QyHqyexw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH v2] core_getversion: Test for desired device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 Helen Koike <helen.koike@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Daniel,
On 2023-09-26 at 09:42:26 -0700, Daniel Stone wrote:
> On Mon, 25 Sept 2023 at 09:22, Rob Clark <robdclark@gmail.com> wrote:
> > +       const char *name = getenv("IGT_REQUIRED_DRIVER");
> >
> > -       fd = drm_open_driver(DRIVER_ANY);
> > +       fd = __drm_open_driver(DRIVER_ANY);
> 
> Shouldn't this try to open the actual driver name? Otherwise we could
> false-fail a test because our 'any driver' picked the wrong device
> when multiple of them are present.

> > -       fd = drm_open_driver(

All kms tests use DRIVER_ANY, what is needed is check later
if DRIVER_ANY actually loaded our driver.

+cc Petri

Regards,
Kamil

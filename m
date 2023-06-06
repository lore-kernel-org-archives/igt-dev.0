Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20230526130001.71730-1-nunes.erico@gmail.com>
 <20230526130001.71730-4-nunes.erico@gmail.com>
 <20230605111738.stcgxju5kjqkdjyi@kamilkon-desk1>
In-Reply-To: <20230605111738.stcgxju5kjqkdjyi@kamilkon-desk1>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Tue, 6 Jun 2023 16:51:39 +0200
Message-ID: <CAK4VdL0++Pch_7xW_u2KFGTC_XkmzaxAzbsphyBHMM09GXvufw@mail.gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Erico Nunes <nunes.erico@gmail.com>, anarsoul@gmail.com, yuq825@gmail.com,
 lima@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/3] tests/lima: Add initial tests
 for lima
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kamil,

On Mon, Jun 5, 2023 at 1:18=E2=80=AFPM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
> > +             map =3D igt_lima_mmap_bo(fd, bo->handle, size, PROT_READ =
| PROT_WRITE);
> --------------- ^
> In your current implementation you can get NULL here.
>
> > +             memset(map, 0xd0, size);
> > +             munmap(map, size);
> > +             igt_lima_free_bo(fd, bo);
> > +
> > +             /* Now, allocate a BO on the other fd and make sure it do=
esn't
> > +              * have the old contents.
> > +              */
> > +             bo =3D igt_lima_gem_new(fd2, size);
> > +             map =3D igt_lima_mmap_bo(fd2, bo->handle, size, PROT_READ=
 | PROT_WRITE);
> --------------- ^
> Same here, mey be NULL.
>
> > +             for (i =3D 0; i < size / 4; i++)
> -------------------------------------- ^
> It may be also sizeof(map[0]) instead of 4.

Thanks for the review. I'll send a v3 addressing these and the reviews
on previous patches in this series.
I just didn't do some of the changes pointed out here as I carried it
on as-is from the v3d/panfrost tests which I used as a reference. But
I can address they here for the initial lima tests.

Thanks

Erico
